#!/bin/bash
FILE_DIR=$(cd `dirname $0` && pwd)
. $FILE_DIR/config.sh

docker build \
    --build-arg DEVELOPER_NAME="$DEVELOPER_NAME" \
    --build-arg DEVELOPER_EMAIL="$DEVELOPER_EMAIL" \
    --build-arg DEVELOPER_USER="$DEVELOPER_USER" \
    --build-arg DEVELOPER_GROUP="$DEVELOPER_GROUP" \
    --build-arg DEVELOPER_UID="$DEVELOPER_UID" \
    --build-arg DEVELOPER_GID="$DEVELOPER_GID" \
    --build-arg DISABLE_USER_CACHE="$DISABLE_USER_CACHE" \
    --build-arg DEVELOPER_TIMEZONE="$DEVELOPER_TIMEZONE" \
    --build-arg APP_LINK_CHROME="$APP_LINK_CHROME" \
    --build-arg APP_LINK_GITKRAKEN="$APP_LINK_GITKRAKEN" \
    --build-arg APP_LINK_PHPSTORM="$APP_LINK_PHPSTORM" \
    --build-arg APP_LINK_INTELLIJ_IDEA="$APP_LINK_INTELLIJ_IDEA" \
    --build-arg APP_LINK_SKIPPER="$APP_LINK_SKIPPER" \
    --build-arg APP_LINK_OC="$APP_LINK_OC" \
    $(if [ $DISABLE_CACHE = 1 ] ; then echo '--no-cache'; fi) \
    -t $DEVMACHINE_IMAGE_NAME $FILE_DIR