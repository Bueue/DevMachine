#!/bin/bash

PARAMS="$@"
if [[ $# -eq 0 ]]; then
    PARAMS="/bin/zsh"
fi

docker exec -itu developer dev-machine $PARAMS