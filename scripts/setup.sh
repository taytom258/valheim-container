#!/bin/bash

cd /home/steam
curl -sqL "https://client-update.steamstatic.com/installer/steamcmd_linux.tar.gz" | tar zxvf -
./steamcmd.sh +force_install_dir /data +login anonymous +quit
./steamcmd.sh +force_install_dir /data +login anonymous +app_update $1 validate +quit

shift
if [[ ! -a /data/run.sh ]]; then
	cp /home/steam/run.sh /data/run.sh
fi

bash /data/run.sh $*