# Terraria

Docker images to run a Terraria Server. Images with [TShock Server](https://tshock.co) or [Vanilla Server](https://terraria.gamepedia.com/Server) are available.

### Supported tags and respective `Dockerfile` links

* vanilla-1.3.5.3, vanilla-latest [(vanilla/1.3.5.3/Dockerfile)](https://github.com/beardedio/terraria/blob/master/vanilla/1.3.5.3/Dockerfile)
* vanilla-1.3.4.4 [(vanilla/1.3.4.4/Dockerfile)](https://github.com/beardedio/terraria/blob/master/vanilla/1.3.4.4/Dockerfile)
* vanilla-1.3.3.3 [(vanilla/1.3.3.3/Dockerfile)](https://github.com/beardedio/terraria/blob/master/vanilla/1.3.3.3/Dockerfile)
* vanilla-1.3.2.1 [(vanilla/1.3.2.1/Dockerfile)](https://github.com/beardedio/terraria/blob/master/vanilla/1.3.2.1/Dockerfile)
* vanilla-1.3.1.1 [(vanilla/1.3.1.1/Dockerfile)](https://github.com/beardedio/terraria/blob/master/vanilla/1.3.1.1/Dockerfile)
* tshock-4.3.25, tshock-latest, latest [(tshock/4.3.25/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock/4.3.25/Dockerfile)
* tshock-4.3.24 [(tshock/4.3.24/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock/4.3.24/Dockerfile)
* tshock-4.3.23 [(tshock/4.3.23/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock/4.3.23/Dockerfile)
* tshock-4.3.22 [(tshock/4.3.22/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock/4.3.22/Dockerfile)
* tshock-4.3.20 [(tshock/4.3.20/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock/4.3.20/Dockerfile)
* tshock-4.3.19 [(tshock/4.3.19/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock/4.3.19/Dockerfile)
* tshock-4.3.18 [(tshock/4.3.18/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock/4.3.18/Dockerfile)
* tshock-4.3.17 [(tshock/4.3.17/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock/4.3.17/Dockerfile)
* tshock-4.3.16 [(tshock/4.3.16/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock/4.3.16/Dockerfile)
* tshock-4.3.15 [(tshock/4.3.15/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock/4.3.15/Dockerfile)
* tshock-dev-2186, tshock-dev-latest [(tshock-dev/2186/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock-dev/2186/Dockerfile)
* tshock-dev-2183 [(tshock-dev/2183/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock-dev/2183/Dockerfile)
* tshock-dev-2181 [(tshock-dev/2181/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock-dev/2181/Dockerfile)
* tshock-dev-2155 [(tshock-dev/2155/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock-dev/2155/Dockerfile)
* tshock-dev-2152 [(tshock-dev/2152/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock-dev/2152/Dockerfile)
* tshock-dev-2111 [(tshock-dev/2111/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock-dev/2111/Dockerfile)
* tshock-dev-2108 [(tshock-dev/2108/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock-dev/2108/Dockerfile)
* tshock-dev-2102 [(tshock-dev/2102/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock-dev/2102/Dockerfile)
* tshock-dev-2099 [(tshock-dev/2099/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock-dev/2099/Dockerfile)
* tshock-dev-2096 [(tshock-dev/2096/Dockerfile)](https://github.com/beardedio/terraria/blob/master/tshock-dev/2096/Dockerfile)

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

#### License

The MIT License (MIT)
Copyright (c) 2018 Brandon Skrtich
