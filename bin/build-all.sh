#!/bin/bash
set -euo pipefail

# Settings
CI_REGISTRY_IMAGE="docker.io/dockerdevs/terraria"

# Colorize me baby
colorize() { CODE=$1; shift; echo -e '\033[0;'$CODE'm'$@'\033[0m'; }
red() { echo -e $(colorize 31 $@); }
green() { echo -e $(colorize 32 $@); }
yellow() { echo -e $(colorize 33 $@); }

# Change to script dir
cd "${0%/*}"

# Change to base dir
cd ..

# Get path
BASEDIR=`pwd`

for file in $BASEDIR/*/*/Dockerfile ; do
    if [[ -f "$file" ]]; then
        cd $(dirname $file)

        TAG=$(basename `pwd`)
        FOLDER=$(basename $(realpath `pwd`/../))

        green "Building $FOLDER-$TAG"

        export STATUS=`curl -s -o /dev/null -w "%{http_code}" https://hub.docker.com/v2/repositories/dockerdevs/terraria/tags/$FOLDER-$TAG/`
        if [ $STATUS == 200 ]; then
            yellow "Tag already exists, skipping build..."
            echo ""
            continue
        fi

        docker build -t $CI_REGISTRY_IMAGE:$FOLDER-$TAG .
        docker push $CI_REGISTRY_IMAGE:$FOLDER-$TAG

        green "$FOLDER-$TAG Done"
        echo ""
    fi
done


green "Done building images"
echo ""
