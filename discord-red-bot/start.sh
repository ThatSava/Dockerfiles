#!/bin/bash

# Install updates
apt-get update && apt-get -y upgrade
pip3 install --upgrade pip Red-DiscordBot

# Start server
redbot mybot --token $TOKEN --prefix $PREFIX