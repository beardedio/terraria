# terraria

Docker images to run a Terraria Server. Images with [TShock Server](https://github.com/Pryaxis/TShock) or [Vanilla Server](https://terraria.gamepedia.com/Server) are available.


[![Auto Build](https://github.com/beardedio/terraria/actions/workflows/main.yml/badge.svg)](https://github.com/beardedio/terraria/actions/workflows/main.yml) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/beardedio/terraria/latest) [![Docker Pulls](https://img.shields.io/docker/pulls/beardedio/terraria.svg)]() [![Docker Stars](https://img.shields.io/docker/stars/beardedio/terraria.svg)]()

### Usage
```
docker create --rm -it \
  --name=terraria \
  -v <path to data>:/config \
  -e world=<world_file_name> \
  -p 7777:7777 \
  ghcr.io/beardedio/terraria:latest
```

Docker Images are avaiable on [ghcr.io](https://github.com/beardedio/terraria/pkgs/container/terraria) and [Docker Hub](https://hub.docker.com/r/beardedio/terraria)

### Supported tags and respective `Dockerfile` links
* vanilla-1.4.5.0, vanilla-latest, latest [(containers/vanilla/1.4.5.0/Dockerfile)](https://github.com/beardedio/terraria/blob/main/containers/vanilla/1.4.5.0/Dockerfile)
* vanilla-1.4.4.9 [(containers/vanilla/1.4.4.9/Dockerfile)](https://github.com/beardedio/terraria/blob/main/containers/vanilla/1.4.4.9/Dockerfile)
* vanilla-1.4.3.6 [(containers/vanilla/1.4.3.6/Dockerfile)](https://github.com/beardedio/terraria/blob/main/containers/vanilla/1.4.3.6/Dockerfile)
* vanilla-1.4.2.3 [(containers/vanilla/1.4.2.3/Dockerfile)](https://github.com/beardedio/terraria/blob/main/containers/vanilla/1.4.2.3/Dockerfile)
* vanilla-1.4.1.2 [(containers/vanilla/1.4.1.2/Dockerfile)](https://github.com/beardedio/terraria/blob/main/containers/vanilla/1.4.1.2/Dockerfile)
* tshock-5.2.4, tshock-latest [(containers/tshock/5.2.4/Dockerfile)](https://github.com/beardedio/terraria/blob/main/containers/tshock/5.2.4/Dockerfile)
* tshock-5.2.3 [(containers/tshock/5.2.3/Dockerfile)](https://github.com/beardedio/terraria/blob/main/containers/tshock/5.2.3/Dockerfile)
* tshock-5.2.2 [(containers/tshock/5.2.2/Dockerfile)](https://github.com/beardedio/terraria/blob/main/containers/tshock/5.2.2/Dockerfile)
* tshock-5.2.1 [(containers/tshock/5.2.1/Dockerfile)](https://github.com/beardedio/terraria/blob/main/containers/tshock/5.2.1/Dockerfile)
* tshock-5.2.0 [(containers/tshock/5.2.0/Dockerfile)](https://github.com/beardedio/terraria/blob/main/containers/tshock/5.2.0/Dockerfile)

### Quick reference
- Where to get help:\
The [TShock Discussions](https://github.com/Pryaxis/TShock/discussions) or the [Terraria Forum](https://forums.terraria.org/index.php?forums/)

- Where to file issues:\
https://github.com/beardedio/terraria/issues

- Maintained by:\
[Henry Skrtich of Bearded.io](https://www.bearded.io/#footer)

- Supported Docker versions:\
[We support the latest release](https://github.com/docker/docker-ce/releases/latest) (down to 1.8 on a best-effort basis)

### What is Terraria Server?
A Terraria server provides a platform for players to connect over the internet or other network for multiplayer games of [Terraria](https://terraria.org/).

## How to use

### Generating a new world
To run with out user intervention Terraria Server needs to be configure to use an already generated world. This means you can use one that you have already generated or you can generate one via docker by running this command:
```
sudo docker run --rm -it -p 7777:7777 \
    -v $HOME/terraria/config:/config \
    --name=terraria \
    ghcr.io/beardedio/terraria:latest
```
You can then follow the prompts to create a new world.

### Starting your server with a preexisting world
The world file needs to exist in the config folder.
To start a server using an already generated world, use this command:
```
sudo docker run --rm -dit \
  --name=terraria \
  -v $HOME/terraria/config:/config \
  -e world=<world_file_name>.wld \
  -p 7777:7777 \
  ghcr.io/beardedio/terraria:latest
```

If you get an error from docker saying the container name already exists, it means you need to remove your old docker container process.
`sudo docker rm terraria`

If you want to reattach to any running containers:
`sudo docker attach terraria`
Now you can execute any commands to the terraria server. Ctrl-p Ctrl-q will detatch you from the process.

### Example Docker Compose file
Here is an example docker-compose file that enables to the use of the vanilla server
```
version: '3'

services:
  terraria:
    image: ghcr.io/beardedio/terraria:latest
    ports:
      - '7777:7777'
    restart: unless-stopped
    environment:
      - world=<world_file_name>.wld
    volumes:
      - $HOME/terraria/config:/config
    tty: true
    stdin_open: true
```

### beardedio/terraria:tshock-latest
TShock is a server modification for Terraria, written in C#, and based upon the Terraria Server API. It uses JSON for configuration management, and offers several features not present in the Terraria Server normally.

### beardedio/terraria:tshock-dev-latest
TShock dev are unreleased development builds of TShock. These builds may be unstable but they are updated faster then the released versions so they support new versions of Terraria faster.

### beardedio/terraria:vanilla-latest
Vanilla Terraria server is the server software provided by the developers of Terraria. This version has only basic features but it is updated along with the main game so it should always be up to date.

If a docker image isn't available of the latest versions please [contact us](https://www.bearded.io/#footer) about the new release so we can update this repo.

### FAQ
- Can I manage my own plugins for tshock?\
Yes, if you want manage you own plugins for tshock containers, you can add a volume mount to your docker command via `-v <path to plugins folder>:/tshock/ServerPlugins`. If you want to maintain any of the plugins that ship with tshock, you will need to copy them into the ServerPlugins folder. Mounting the plugins folder will override the plugins that ship with tshock.
- I started the container but it keeps asking me to select a world, help?!\
You need to ether start the server with an existing world, in which case the server will start automaticly. Or you need to run the continer interactivly using the -it flag. This will allow you to create a new world.
-The server returns a "System.NullReferenceException" exception when loading a world. Help!\
The server requires a tty connection, so when starting the server via docker run make sure to include the -it flag. Or if running using docker-compose make sure to add tty: true (see this [issue](https://github.com/beardedio/terraria/issues/7))

#### *Notes*
* Please check the [TShock instructions](https://tshock.readme.io/docs/getting-started) for properly installing and configuring your terraria server.
* Any [additional command-line instructions](https://tshock.readme.io/docs/command-line-parameters) can be added to the end of either method for launching a server.  Docker maps the $HOME/terraria/world linux-host folder to the /tshock/world container-folder.
* More information about running a server is available in the [wiki](https://terraria.gamepedia.com/Server).

#### License

The MIT License (MIT)
Copyright (c) 2026 Henry Skrtich
