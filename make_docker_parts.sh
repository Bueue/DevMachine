#!/bin/bash

docker_run_parts="dockerparts/"

rm -fr $docker_run_parts
mkdir $docker_run_parts

apps_installers_folder="scripts/apps-installers"

for app in $(ls $apps_installers_folder); do
    echo "--> processing: $app"

    docker_run_part=$(echo $docker_run_parts/$app | sed 's/.sh/.dockerpart/')

    # read file, remove empty lines
    cat $apps_installers_folder/$app | sed -r '/^\s*$/d' | sed '/#!\/bin\/bash/d' | awk 'NR > 1{print line" && \\\\"}{line=$0;}END{print $0" "}' | while read line; do
        echo $line >> $docker_run_part
    done

    echo -e "RUN $(cat $docker_run_part)" > $docker_run_part
done