#!/bin/bash
. $(cd `dirname $0` && pwd)/../config.sh

docker exec -ti \
    -u $DEVELOPER_UID:$DEVELOPER_GID \
    $DEVMACHINE_NAME \
    /bin/bash -c \
    /opt/devmachine/devmachine_config.sh