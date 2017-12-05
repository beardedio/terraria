#!/bin/bash
set -euo pipefail

CMD="mono --server --gc=sgen -O=all TerrariaServer.exe -configpath /config -worldpath /config -logpath /config"

# Pass in world if set
if [ "${world:-null}" != null ]; then
    if [ ! -f "/config/$world" ]; then
        echo "World file does not exist! Quitting..."
        exit 1
    fi
    CMD="$CMD -world /config/$world"
fi

exec $CMD $@
