#!/bin/bash

. ./make_dockerfile.sh

docker build -t dev-machine . "$@"