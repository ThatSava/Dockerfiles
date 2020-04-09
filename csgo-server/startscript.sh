#!/bin/bash

rcon_password=$RCONPW
password=$PASSWORD

if [ "$rcon_password" != "" ]
then
    rcon_password="+rcon_password "${rcon_password}" \
    -usercon"
fi

if [ "$password" != "" ]
then
    password="+sv_password "${password}
fi

ip=$(curl -s ifconfig.me)

#Check if cfg file is created
#Download esl config

${STEAMCMDDIR}/steamcmd.sh \
		+login anonymous +force_install_dir ${STEAMAPPDIR} +app_update ${STEAMAPPID} +quit \
		&& ${STEAMAPPDIR}/srcds_run \
            -game csgo \
            -tickrate ${TICKRATE} \
            -maxplayers ${MAXPLAYERS} \
            +fps_max ${FPSMAX} \
            +game_type ${GAMETYPE} \
            +game_mode ${GAMEMODE} \
            +mapgroup ${MAPGROUP} \
            +map ${MAP} \
            +sv_setsteamaccount ${AUTHKEY} \
            ${rcon_password} \
            ${password} \
            +sv_region ${REGION} \
            +clientport 27005 \
            +tv_port 27020 \
            -port 27015 \
            +net_public_adr ${ip} \
            -ip 0.0.0.0 \
            +ip 0.0.0.0 \
            ${CUSTOMPARAMETERS}

            