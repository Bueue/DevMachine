#!/bin/bash
. $(cd `dirname $0` && pwd)/../config.sh

docker exec -d \
    -u $DEVELOPER_UID:$DEVELOPER_GID \
    $DEVMACHINE_NAME \
    gitkraken