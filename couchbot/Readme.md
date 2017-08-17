# How to use
1. Install docker, for this refer to the [official instructions](https://docs.docker.com/engine/installation/#supported-platforms)
2. Make a new folder with `mkdir CouchBot` and enter it with `cd CouchBot`
3. Download the special configuration by running `wget https://raw.githubusercontent.com/andrejsavikin/Dockerfiles/master/couchbot/BotSettings.json`
4. Edit it with `nano BotSettings.json`, make sure **NOT** to change the Directories part, for more details check out the [CouchBot wiki](https://github.com/dawgeth/CouchBot/wiki/Self-Host-Bot-Configuration)
5. Make a new folder called Data with `mkdir Data`
6. Start the container with the following code `docker run -dit -v $(pwd)/Data:/Data -v $(pwd)/BotSettings.json:/CouchBot/BotSettings.json --name Couchbot andrejsavikin/couchbot`
7. Enjoy your bot

# Additional commands
To stop your bot use `docker stop Couchbot`
To start your bot use `docker start Couchbot`
To see your bot's logs use `docker logs Couchbot`
To check the running docker containers use `docker ps`
