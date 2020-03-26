#!/bin/bash

source ./bootstrap.sh

USER_UID=$(id -u)

docker run -ti --rm \
    -e TZ='Europe/Rome' \
    -e DISPLAY=$DISPLAY \
    -v /usr/share/icons:/usr/share/icons \
    -v /usr/share/fonts:/usr/share/fonts \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /run/user/${USER_ID}/pulse:/run/user/1000/pulse \
    --shm-size=8g \
    --privileged \
    -u developer \
    -v $DEVMACHINE_DEV_USER:/home/developer \
    --name dev-machine \
    dev-machine
