# How to use
1. Install docker, for this refer to the [official instructions](https://docs.docker.com/engine/installation/#supported-platforms)
2. Make a new folder with `mkdir CouchBot` and enter it with `cd CouchBot`
3. Download the special configuration by running `wget https://raw.githubusercontent.com/andrejsavikin/Dockerfiles/master/couchbot/BotSettings.json`
4. Edit it with `nano BotSettings.json`, make sure **NOT** to change the Directories part, for more details check out the [CouchBot wiki](#how-to-generate-api-keys)
5. Make a new folder called Data with `mkdir Data`
6. Start the container with the following code `docker run -dit -v $(pwd)/Data:/Data -v $(pwd)/BotSettings.json:/CouchBot/BotSettings.json --name Couchbot andrejsavikin/couchbot`
7. Enjoy your bot

# Additional commands
To stop your bot use `docker stop Couchbot`
To start your bot use `docker start Couchbot`
To see your bot's logs use `docker logs Couchbot`
To check the running docker containers use `docker ps`

# How to generate api keys
## Google/Youtube
1. Go to [google console](https://console.developers.google.com/), make a new project (next to the google logo) and select it
2. On the left hand side select "Library", then under YouTube APIs select YouTube Data API
3. Now press enable on top of the page
4. In the same left hand menu select Credentials
5. Press on the blue button that says "Create Credentials", then select "API key" and copy the resulting key

## Twitch
1. Go to [twitch's register an application page](https://www.twitch.tv/kraken/oauth2/clients/new)
2. Enter an application name
3. For "Redirect URI" set "http://localhost"
4. For "Application Category" select "Chat Bot"
5. Accept the terms and Register the application
6. Copy the client ID from that page into the configuration file

## Discord
1. Go to [discord developers](https://discordapp.com/developers/applications/me)
2. Press "New App" and set the app name, this app name is also going to be the bot username
3. Press "Create App"
4. Here press the blue button that says "Create a Bot User" and confirm creation
5. Copy the Client ID and paste it in the configuration file under CouchBotId
6. Under App Bot User select if you want the bot to be public or just yours
7. Also under App Bot User, press the blue text to reveal the Token, copy it and paste it in the configuration file

# Adding the bot to a guild
1. Get the bot Client ID
2. In the following link, replace "000000000000000000" with your client ID https://discordapp.com/api/oauth2/authorize?client_id=000000000000000000&scope=bot&permissions=0
3. Go to that link, and select the guild you want the bot to be added to

# Get the owner Client ID
1. Open up the settings on your discord client
2. Go to "Appearance" and enable "Developer Mode", close out of the settings afterwards
3. Right click your username in the user list and select "Copy ID"

# Support
In case you managed to get stuck along the way, feel free to join my guild and ping me(Sava) so I can try and help you out
[![Discord](https://discordapp.com/api/guilds/69730004467986432/widget.png?style=banner4)](https://discord.gg/jBRvWct)
