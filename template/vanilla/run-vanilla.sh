#!/bin/bash
set -euo pipefail

CMD="./TerrariaServer -x64 -config /config/serverconfig.txt -banlist /config/banlist.txt"

# Create default config files if they don't exist
if [ ! -f "/config/serverconfig.txt" ]; then
    cp ./serverconfig-default.txt /config/serverconfig.txt
fi

if [ ! -f "/config/banlist.txt" ]; then
    touch /config/banlist.txt
fi

# Link Worlds folder to /config so it will save to the correct location
if [ ! -s "/root/.local/share/Terraria/Worlds" ]; then
    mkdir -p /root/.local/share/Terraria
    ln -sT /config /root/.local/share/Terraria/Worlds
fi

# Pass in world if set
if [ "${world:-null}" != null ]; then
    if [ ! -f "/config/$world" ]; then
        echo "World file does not exist! Quitting..."
        exit 1
    fi
    CMD="$CMD -world /config/$world"
fi

# trap SIGTERM signal and call graceful_shutdown
trap 'kill ${!}; graceful_shutdown' SIGTERM

function graceful_shutdown() {
    # Send a message to players that the server is shutting down
    # echo say 'Server shutting down' > /vanilla/console
    screen -p 0 -S terraria_server_screen -X eval "stuff 'say Server shutting down'\015"

    echo "Stopping Terraria server..."
    echo "Saving world"

    screen -p 0 -S terraria_server_screen -X eval "stuff 'exit'\015"
    # echo exit  > /vanilla/console

    # Waiting for server to finish saving & shutting down
    pid=$(pgrep -f ^./TerrariaServer)
    if [ -z "$pid" ]; then exit 1; fi
    while [ -e /proc/$pid ]; do
        sleep 1
    done
    echo "World save complete"
    echo "Shutting down"
    exit 0
}

echo "Starting container, CMD: $CMD $@"
screen -AmdS terraria_server_screen bash -c "$CMD $@ | tee -a /config/server.log"
sleep 5
tail -f /config/server.log &
#(tail -f > /vanilla/console & $CMD $@ < console) &

tail -f /dev/null & wait ${!}

pid=$(pgrep -f ^./TerrariaServer)
if [ -z "$pid" ]; then exit 1; fi
while [ -e /proc/$pid ]; do
   sleep 5
done