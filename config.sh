#!/bin/bash

. config-user.sh

DEVELOPER_TIMEZONE="Europe/Rome"

#DEVELOPER_USER=$(id -un)
#DEVELOPER_GROUP=$(id -gn)
DEVELOPER_USER="developer"
DEVELOPER_GROUP="developer"
DEVELOPER_UID=$(id -u)
DEVELOPER_GID=$(id -g)

DEVMACHINE_IMAGE_NAME=devmachine_v1.3.0
DEVMACHINE_NAME=$DEVMACHINE_IMAGE_NAME-${USER}
DEVMACHINE_HOSTNAME=devmachine

# Main cache for the build (1: on, 0: off)
DISABLE_CACHE=1
# The default user's configuration cache is disabled: set a constant value to activate it
DISABLE_USER_CACHE=$(date +%s)

# Apps links
APP_LINK_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
APP_LINK_GITKRAKEN="https://release.gitkraken.com/linux/gitkraken-amd64.deb"
APP_LINK_PHPSTORM="https://download.jetbrains.com/webide/PhpStorm-2019.3.3.tar.gz"
APP_LINK_INTELLIJ_IDEA="https://download.jetbrains.com/idea/ideaIC-2019.3.3.tar.gz"
APP_LINK_SKIPPER="https://downloads.skipper18.com/3.2.22.1624/Skipper-3.2.22.1624-Linux-all-64bit.zip"
APP_LINK_OC="https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz"

# Mounted folders
HOME_DIR=~/Devmachine/home
DOCKER_DATA_DIR=~/Devmachine/docker-data

# Shared memory size (https://docs.docker.com/engine/reference/run/#runtime-constraints-on-resources)
SHM_SIZE="2g"

# VPN
VPN_AUTHGROUP="your-vpn-group"
VPN_HOST="your-vpn-host"