# Red discord bot dockerfile
Red Discord Bot
made by the Cog creators at https://github.com/Cog-Creators/Red-DiscordBot

This is an update of [JonasBonno's discord bot dockerfile](https://github.com/JonasBonno/docker-discordbot) that is based on Debian linux, instead of Alpine linux. This is done in order to once again add suport for audio cog, which doesn't work with musl, found in Alpine linux. Lavaplayer, which is used as a dependency for the bot, developers are aware of this bug and there is an issue open to add support for musl [#537](https://github.com/sedmelluq/lavaplayer/issues/537).

#### *Music, Moderation, Trivia, Stream Alerts and Fully Modular*  
<img src="https://imgur.com/pY1WUFX.png" width="720" height="385">

# Setup
You can run the bot by executing the following command: 
`docker run --tty=true --interactive=true --detach=true --restart unless-stopped --name [name of your container] --env TOKEN="[your discord bot token]" thatsava/discord-red-bot:latest`.
Furthermore, if you wish to have data persistency, you can mount the data directory to host by adding the following argument `-v $(pwd):/root/.local/share/Red-DiscordBot/data/mybot`.
Make sure to set a name and your discord token in the appropriate places. You can read below how to generate your bot token. [How to generate bot token](#generating-bot-token).
After running your bot, a join link for the bot will be visible in the console. You can see the container output by executing `docker logs [name of your container]`.

# Supported environment variables
`--env TOKEN=[your discord bot token]` - The Discord token the Red-DiscordBot will use.
`--env PREFIX=!` - The prefix Red-DiscordBot will use. Default set to "!" if you don't specify it.

# Generating bot token
1. Go to [discord developers](https://discordapp.com/developers/applications/me)
2. Press "New App" and set the app name, this app name is also going to be the bot username
3. Press "Create App"
4. Here press the blue button that says "Create a Bot User" and confirm creation
5. Under App Bot User select if you want the bot to be public or just yours
6. Enable Presence intent and Server members intent. This is required for the bot to work!
7. Also under App Bot User, press the blue text to reveal the Token, copy it and paste where needed

# Docker compose
Docker compose file example can be found in this github repo. You can download it, edit it to add your bot token and specify data location and execute it by running `docker-compose up -d`. This is my prefered way of running this container as it doesn't require me to type out long run commands.

### Overview
Red is a fully modular bot – meaning all features and commands can be enabled/disabled to your liking, making it completely customizable. This is a self-hosted bot – meaning you will need to host and maintain your own instance. You can turn Red into an admin bot, music bot, trivia bot, new best friend or all of these together!

### Tips
- Set admin role: <code>!set addadminrole [your discord admin group]</code>
- Set moderator role: <code>!set addmodrole [your discord moderator group]</code>
- Show loaded and unloaded cogs: <code>!cogs</code>
- Load music cog: <code>!load music</code>

**The default set of modules includes and is not limited to:**

- Moderation features (kick/ban/softban/hackban, mod-log, filter, chat cleanup)
- Trivia (lists are included and can be easily added)
- Music features (YouTube, SoundCloud, local files, playlists, queues)
- Stream alerts (Twitch, Youtube, Hitbox, Picarto)
- Bank (slot machine, user credits)
- Custom commands
- Imgur/gif search
- Admin automation (self-role assignment, cross-server announcements, mod-mail reports)
- Customisable command permissions

# Support
In case you need help, feel free to join my guild and ping me(Sava) so I can try and help you out
[![Discord](https://discordapp.com/api/guilds/232615454034624514/widget.png?style=banner4)](https://discord.gg/QUaESSv)
