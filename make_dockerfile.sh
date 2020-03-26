#!/bin/bash

. ./make_docker_parts.sh

dockerparts_folder="dockerparts"
dockerparts_union="dockerparts.dockerpart"

cat $(ls -d $dockerparts_folder/*) > $dockerparts_union

cp Dockerfile.dist Dockerfile

sed -i "/###dockerparts###/r $dockerparts_union" Dockerfile

rm -fr $dockerparts_folder $dockerparts_union