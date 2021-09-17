FROM openjdk:11-jre-bullseye

ENV TOKEN=""
ENV PREFIX="!"

#Install dependencies
RUN apt update && apt -y install \
        python3 \
        python3-dev \
        python3-venv \
        python3-pip \
        git \
        build-essential \
        nano

# Install Red-DiscordBot
RUN pip3 install Red-DiscordBot

# Setup redbot server
RUN { echo "mybot"; echo "/root/.local/share/Red-DiscordBot/data/mybot"; echo "Y"; echo "1"; } | redbot-setup

# Expose volumes
VOLUME ["/root/.local/share/Red-DiscordBot/data/mybot"]

# Set workdir
WORKDIR /root/.local/share/Red-DiscordBot/data/mybot

# Add startscript and execute it
ADD start.sh /start.sh
RUN chmod 0755 /start.sh
CMD ["bash", "/start.sh"]