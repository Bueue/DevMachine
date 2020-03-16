#!/bin/bash

ROOTDIR=$(cd `dirname $0` && pwd)

. $ROOTDIR/config.sh

# Choose the apps to launch
if [ ! $(docker ps -q -f name=$DEVMACHINE_NAME) ] ; then
    $ROOTDIR/run.sh
    $ROOTDIR/apps/exec-config.sh           # To execute the first time
    $ROOTDIR/apps/exec-vpn.sh              # Then use the shortcut CTRL-p CTRL-q
    $ROOTDIR/apps/exec-chrome.sh           # Browser
    $ROOTDIR/apps/exec-phpstorm.sh         # PHP IDE
    #$ROOTDIR/apps/exec-intelliJidea.sh     # JAVA IDE
    #$ROOTDIR/apps/exec-skipper.sh          # ORM Designer
    #$ROOTDIR/apps/exec-sqldeveloper.sh     # Oracle client
    $ROOTDIR/apps/exec-gitkraken.sh        # GIT GUI
    $ROOTDIR/apps/exec-insomnia.sh         # REST client
    $ROOTDIR/apps/exec-bash.sh
else 
    echo "$DEVMACHINE_NAME container already started"
fi
