#!/bin/bash

date=`date +"%Y-%m-%d-%H%M"`
#Place your game server specific run instructions below here

cd /data
cp /data/start_server.sh /data/start_server_local.sh
touch /data/logs/$date-server.log
sed -i 's#./valheim_server.x86_64.*#./valheim_server.x86_64 -batchmode -nographics -name "Dedicated Server" -port 2456 -world "Dedicated" -password "change_me" -savedir /data/worlds -preset normal -crossplay#g' \
/data/start_server_local.sh

/bin/bash /data/start_server_local.sh @*