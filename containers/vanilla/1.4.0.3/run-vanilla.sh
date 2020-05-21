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

exec $CMD $@
