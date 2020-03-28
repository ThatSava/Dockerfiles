# Garry's mod dedicated server

## Installation

1. Make sure you have docker installed, configured and have the appropriate permissions.
2. In the following command replace the key with your authkey obtained from steam, you can read more about that in [Authkey](#Authkey) section.
3. To launch from command line you can use the following command `docker run -d -it -e AUTHKEY=KEYKEYKEY -p 27015:27015/tcp -p 27005:27005/tcp -p 27015:27015/udp --name=garrysmodServer thatsava/garrysmod`
4. If you want to additionally configure the game server, look in the [Env variables](#Env-variables) section.

# Authkey

You now need an authkey from steam to be able to host Garry's mod dedicated server for more than one player. You can obtain the key by going to the [Steam Game Server Account Management](https://steamcommunity.com/dev/managegameservers) and creating a new game server account. In the App ID field, make sure to enter `4000`, and in the note you can enter whatever you like.

# Env variables

You can completely configure the server by specifying env variables and configuring server.cfg file (More about that in [Data preservation](#Data-preservation)).

Available env variables are as follows:

| Key                  | Default Value        | Description          | 
| -------------------- | -------------------- | -------------------- |
| MAXPLAYERS           | 16                   | Maximum amount of players the server will allow |
| GAMEMODE             | sandbox              | The gamemode server will load with              |
| MAP                  | gm_flatgrass         | The map server will load with |
| WORKSHOPCOLLECTIONID |                      | The server will download and mount the collection with this id |
| AUTHKEY              |                      | *Required* You need to specify the game key from [Authkey section](#Authkey) |
| CUSTOMPARAMETERS     |                      | Any text from this env variable will be passed to the server as command line argument |

# Data preservation

If you want to configure the server.cfg file or not have to download the game each time you use docker run, you can mount the files from the cotainer to a local folder, you can do that by adding `--volume /home/localuser/garrysmod:/home/steam/garrysmod` to the docker run command. `/home/localuser/garrysmod` should point to a valid directory which can be edited by the docker `steam` user.

# Portforwarding

Ports that are needed for the server are:  
TCP:27005, 27015  
UDP: 27015  
Make sure to foward these ports on your router, and on your firewall. If you use iptables, docker should automatically forward these for you. These ports can be changed in the server command or docker-compose file

# docker-compose

This image can also be started using [docker-compose](https://docs.docker.com/compose/).

This is an example `docker-compose.yml` file:
```
garrysmod:
  ports:
    - "27015:27015"
    - "27005:27005"
    - "27015:27015/udp"

  environment:
    WORKSHOPCOLLECTIONID: "0000000"
    AUTHKEY: "00000"

  image: thatsava/gmod-server

  container_name: garrysmodServer

  volumes:
    - "/home/user/garrysmodFiles:/home/steam/garrysmod"

  tty: true
  stdin_open: true
```

More env variables can be set in the environment section. You can start the server after saving this file to a folder, editing appropriate env vars and running `docker-compose up -d`.