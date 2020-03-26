#!/bin/bash

PARAMS="$@"
if [[ $# -eq 0 ]]; then
    PARAMS="/bin/bash"
fi

docker exec -itu developer dev-machine $PARAMS