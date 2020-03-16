#!/bin/bash

# User's configuration file
if [ ! -f ~/.bashrc ]; then
    cp /etc/skel/.bashrc ~
    echo "~/.bashrc file created"
fi

# Bash aliases
printf "\n"
if [ ! -f ~/.bash_aliases ]; then
    read -p "Do you want to import the ~/.bash_aliases file? y/n " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        cp /opt/devmachine/.bash_aliases ~
        printf "\n~/.bash_aliases file created\n"
    fi
else
    read -p "Do you want to replace the ~/.bash_aliases file? y/n " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        cp /opt/devmachine/.bash_aliases ~
        printf "\n~/.bash_aliases file replaced\n"
    fi
fi

# GIT
printf "\n\nGIT configuration:\n"
git config --global user.name "$DEVELOPER_NAME"
git config --global user.email "$DEVELOPER_EMAIL"
git config -l

# SSH
printf "\n"
read -p "Do you want to generate a new SSH key? y/n " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    printf "\nSSH key generation:"
    ssh-keygen -t rsa -C "$DEVELOPER_EMAIL" -b 4096 -f ~/.ssh/id_rsa
    echo "Public key:"
    ssh-keygen -f ~/.ssh/id_rsa -y
fi
printf "\n"