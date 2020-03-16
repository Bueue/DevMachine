#!/bin/bash
. $(cd `dirname $0` && pwd)/../config.sh

docker exec -ti \
    -u root \
    $DEVMACHINE_NAME \
    openconnect -u $DEVELOPER_EMAIL --authgroup $VPN_AUTHGROUP $VPN_HOST