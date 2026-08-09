#!/bin/bash

date=`date +"%Y-%m-%d-%H%M"`
server_name="Dedicated Server"
server_pass="change_me"
server_world="Dedicated"

cd /data
cp /data/start_server.sh /data/start_server_local.sh
if [[ $server_name == "Dedicated Server" ]] || [[ $server_pass == "change_me" ]]; then
	echo For your security, please set the server name and password in /data/run.sh before restarting the server...
	exit 0
fi
sed -i "s#./valheim_server.x86_64.*#./valheim_server.x86_64 -batchmode -nographics -name ${server_name} -port 2456 -world ${server_world} -password ${server_pass} -savedir /data/worlds -preset normal -crossplay#g" \
/data/start_server_local.sh

/bin/bash /data/start_server_local.sh @*