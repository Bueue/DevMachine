#!/bin/bash
. $(cd `dirname $0` && pwd)/config.sh
echo Starting $DEVMACHINE_NAME container with ID:

if [ ! -d $HOME_DIR ] ; then
    mkdir -p $HOME_DIR
fi
if [ ! -d $DOCKER_DATA_DIR ] ; then
    mkdir $DOCKER_DATA_DIR
fi

docker run -ti -d --rm \
        --name=$DEVMACHINE_NAME \
        --privileged=true \
        --group-add docker \
        -h $DEVMACHINE_HOSTNAME \
        -e "TERM=xterm-256color" \
        -e DISPLAY \
        -e "PULSE_SERVER=unix:/run/user/$DEVELOPER_UID/pulse/native" \
        -e "DEVELOPER_NAME=${DEVELOPER_NAME}" \
        -e "DEVELOPER_EMAIL=${DEVELOPER_EMAIL}" \
        -e "DEVELOPER_ID=${DEVELOPER_ID}" \
        -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
        -v $HOME_DIR:/home/${DEVELOPER_USER} \
        -v $DOCKER_DATA_DIR:/var/lib/docker \
        -v /run/user/${UID}/pulse:/run/user/$DEVELOPER_UID/pulse \
        -v /usr/share/fonts:/usr/share/fonts \
        -v /usr/share/icons:/usr/share/icons \
        --shm-size=$SHM_SIZE \
        $DEVMACHINE_IMAGE_NAME