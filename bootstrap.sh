#!/bin/bash

# create variable
DEVMACHINE_ROOT="$HOME/.dev-machine"
DEVMACHINE_DEV_USER="$DEVMACHINE_ROOT/home/developer"
DEVMACHINE_DEV_USER_DOWNLOAD="$DEVMACHINE_DEV_USER/Download"

# create configuration for dev-machine
if [[ ! -d "$DEVMACHINE_ROOT" ]]; then
    mkdir $DEVMACHINE_ROOT
    mkdir -p $DEVMACHINE_DEV_USER
    mkdir -p $DEVMACHINE_DEV_USER/Downloads
    mkdir -p $DEVMACHINE_DEV_USER/docker-root
fi

# create link to go to dev-machine home
if [[ ! -e "$HOME/dev-machine_home" ]]; then
    rm $HOME/dev-machine_home
    ln -s $DEVMACHINE_DEV_USER $HOME/dev-machine_home
fi;

# vpnserver
cp ./configs/vpnserver.conf $DEVMACHINE_DEV_USER/vpnserver.conf

# export variable
export DEVMACHINE_ROOT
export DEVMACHINE_DEV_USER
export DEVMACHINE_DEV_USER_DOWNLOAD