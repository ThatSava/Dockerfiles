FROM cm2network/steamcmd:latest

LABEL maintainer="andrejsavikin@gmail.com"

ENV STEAMAPPID 4020
ENV STEAMAPPDIR /home/steam/garrysmod

RUN set -x \
    && "${STEAMCMDDIR}/steamcmd.sh" \
    +login anonymous \
    +force_install_dir ${STEAMAPPDIR} \
    +app_update ${STEAMAPPID} validate \
    +quit

ENV MAXPLAYERS="16" \
    GAMEMODE="sandbox" \
    MAP="gm_flatgrass" \
    WORKSHOPCOLLECTIONID="" \
    AUTHKEY="" \
    CUSTOMPARAMETERS=""

WORKDIR $STEAMAPPDIR
VOLUME $STEAMAPPDIR



ENTRYPOINT ${STEAMCMDDIR}/steamcmd.sh \
		+login anonymous +force_install_dir ${STEAMAPPDIR} +app_update ${STEAMAPPID} +quit \
		&& ${STEAMAPPDIR}/srcds_run \
			-game garrysmod \
            -maxplayers ${MAXPLAYERS} \
            +sv_setsteamaccount ${AUTHKEY} \
            +host_workshop_collection ${WORKSHOPCOLLECTIONID} \
            +gamemode ${GAMEMODE} \
            +map ${MAP} \
            ${CUSTOMPARAMETERS}


EXPOSE 27015/udp \
    27005/tcp \
    27005/tcp