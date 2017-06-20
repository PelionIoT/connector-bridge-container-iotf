#!/bin/sh

TAG="latest"

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
sleep 10
ice rm --force $5
sleep 10
image_id="`ice images | grep mbed_connector_bridge:${TAG} | cut -d' ' -f1`"
if [ "${image_id}X" != "X" ]; then
    ice rmi ${image_id} 
    sleep 10
fi
ice build -t registry.ng.bluemix.net/$4/mbed_connector_bridge:${TAG} .
sleep 10
cf login -u $1 -p $2 -s $3 -a api.ng.bluemix.net
./bluemix_run.sh $4 $5
