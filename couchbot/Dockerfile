FROM ubuntu:16.04
LABEL maintainer="andrejsavikin@gmail.com"

RUN apt-get update && apt-get -y install curl apt-transport-https unzip wget
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list'

RUN apt-get update && apt-get install -y dotnet-sdk-2.0.0

RUN sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
RUN apt-get update && apt-get -y install dotnet-dev-1.0.4

RUN wget http://couchbot.io/release/CouchBot_Ubuntu1604.zip
RUN unzip CouchBot_Ubuntu1604.zip
RUN rm CouchBot/BotSettings.json
# ADD BotSettings.json CouchBot/BotSettings.json
RUN mkdir /Data
VOLUME ["/Data","/CouchBot"]

WORKDIR /CouchBot
ENTRYPOINT ["dotnet" , "MTD.CouchBot.dll"]
