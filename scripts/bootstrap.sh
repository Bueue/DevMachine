#!/bin/bash

# docker
sudo service docker start

# time
sudo ntpd -gq
sudo service ntp start
#if [[ ! -z ${TZ} ]]; then
#    sudo echo ${TZ} > /etc/timezone && \
#    dpkg-reconfigure -f noninteractive tzdata
#    echo "Container timezone set to: $TZ"
#else
#    echo "Container timezone not modified"
#fi

# bash-git-prompt
# useful to have colorful and useful git CLI
if [[ ! -e "$HOME/.bash-git-prompt" ]]; then
    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
fi

# interactive shell
/bin/bash