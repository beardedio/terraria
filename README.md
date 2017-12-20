# Terraria

Docker images to run a Terraria Server. Images with [TShock Server](https://tshock.co) or [Vanilla Server](https://terraria.gamepedia.com/Server) are available.

### Supported tags and respective `Dockerfile` links

* vanilla-1.3.5.3, vanilla-latest [(vanilla/1.3.5.3/Dockerfile)](https://github.com/beardedio/terraria/blob/master/vanilla/1.3.5.3/Dockerfile)
* vanilla-1.3.4.4 [(vanilla/1.3.4.4/Dockerfile)](https://github.com/beardedio/terraria/blob/master/vanilla/1.3.4.4/Dockerfile)
* vanilla-1.3.3.3 [(vanilla/1.3.3.3/Dockerfile)](https://github.com/beardedio/terraria/blob/master/vanilla/1.3.3.3/Dockerfile)
* vanilla-1.3.2.1 [(vanilla/1.3.2.1/Dockerfile)](https://github.com/beardedio/terraria/blob/master/vanilla/1.3.2.1/Dockerfile)
* vanilla-1.3.1.1 [(vanilla/1.3.1.1/Dockerfile)](https://github.com/beardedio/terraria/blob/master/vanilla/1.3.1.1/Dockerfile)
* tshock-4.3.24, tshock-latest, latest [(tshock/4.3.24/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock/4.3.24/Dockerfile)
* tshock-4.3.23 [(tshock/4.3.23/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock/4.3.23/Dockerfile)
* tshock-dev-1738, tshock-dev-latest [(tshock-dev/1738/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock-dev/1738/Dockerfile)
* tshock-dev-1733 [(tshock-dev/1733/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock-dev/1733/Dockerfile)
* tshock-dev-1713 [(tshock-dev/1713/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock-dev/1713/Dockerfile)

### Quick reference

### What is Terraria Server?
A Terraria server provides a platform for players to connect over the internet or other network for multiplayer games.

### beardedio/terraria:tshock-<version>

### beardedio/terraria:tshock-dev-<version>

### beardedio/terraria:vanilla-<version>

#### *Notes*
* Please check the [tshock instructions](https://tshock.atlassian.net/wiki/display/TSHOCKPLUGINS/Configuration+File+Docs) for properly installing and configuring your terraria server.
* Any [additional command-line instructions](https://tshock.atlassian.net/wiki/display/TSHOCKPLUGINS/Command+Line+Parameters) can be added to the end of either method for launching a server.  Docker maps the $HOME/terraria/world linux-host folder to the /tshock/world container-folder.
* More information about running a server is available in the [wiki](https://terraria.gamepedia.com/Server).
* This repo is a fork of [ryansheehan/terraria](https://github.com/ryansheehan/terraria)

#### License

The MIT License (MIT)
Copyright (c) 2017 Brandon Skrtich, Ryan Sheehan
