# Terraria

Docker images to run a Terraria Server. Images with [TShock Server](https://tshock.co) or [Vanilla Server](https://terraria.gamepedia.com/Server) are available.

## Available Tags
* latest - This is the same image as tshock-latest
* tshock-latest - This has the latest released version of tshock
* tshock-VERSION - This has a specific version of tshock
* tshock-dev-latest - This has the latest dev version of tshock. Dev version may not work.
* tshock-dev-VERSION - This has a specific dev version of tshock. Dev version may not work.
* vanilla-latest - This has the latest released version of the vanilla server
* vanilla-VERSION - This has a specific version of the vanilla server


## WARNING
This project is currently a work in progress. Right now it does not auto update with new versions.


## *Notes*
* sudo may not be required if logged into your linux machine as the root user.
* Please check the [tshock instructions](https://tshock.atlassian.net/wiki/display/TSHOCKPLUGINS/Configuration+File+Docs) for properly installing and configuring your terraria server.
* Any [additional command-line instructions](https://tshock.atlassian.net/wiki/display/TSHOCKPLUGINS/Command+Line+Parameters) can be added to the end of either method for launching a server.  Docker maps the $HOME/terraria/world linux-host folder to the /tshock/world container-folder.
* This repo is a fork of [ryansheehan/terraria](https://github.com/ryansheehan/terraria)
