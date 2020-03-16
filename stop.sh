#!/bin/bash
. $(cd `dirname $0` && pwd)/config.sh
echo Stopping $DEVMACHINE_NAME container
docker stop $DEVMACHINE_NAME