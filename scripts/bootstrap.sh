#!/bin/bash

# docker
sudo service docker start

# oh-my-zsh
# useful to have colorful and useful git CLI
if [[ ! -e "$HOME/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# interactive shell
/bin/zsh