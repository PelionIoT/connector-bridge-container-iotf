#!/bin/sh

if [ "$1" = "" ]; then 
   echo "Usage: $0 <bm user> <bm password> <space> <container namespace> <container instance name>"
   exit 1
fi

if [ "$2" = "" ]; then 
   echo "Usage: $0 <bm user> <bm password> <space> <container namespace> <container instance name>"
   exit 1
fi

if [ "$3" = "" ]; then
   echo "Usage: $0 <bm user> <bm password> <space> <container namespace> <container instance name>"
   exit 1
fi

if [ "$4" = "" ]; then
   echo "Usage: $0 <bm user> <bm password> <space> <container namespace> <container instance name>"
   exit 1
fi

if [ "$5" = "" ]; then
   echo "Usage: $0 <bm user> <bm password> <space> <container namespace> <container instance name>"
   exit 1
fi

set -x
ice login -u $1 -p $2 -s $3
ice namespace set $4
ice stop $5
sleep 30
ice rm --force $5
sleep 30
image_id="`ice images | grep connector_bridge_img:jan2016 | cut -d' ' -f1`"
if [ "${image_id}X" != "X" ]; then
    ice rmi ${image_id} 
    sleep 30
fi
ice build -t registry.ng.bluemix.net/$4/connector_bridge_img:jan2016 .
sleep 30
cf login -u $1 -p $2 -s $3 -a api.ng.bluemix.net
./run_connector_bridge.sh $4 $5
