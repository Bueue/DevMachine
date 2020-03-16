# DevMachine
The *DevMachine* is a Docker-in-Docker development environment, actually tested on Ubuntu 18.04 LTS.
The purpose is to isolate the processes that require a VPN connection, and more in general enable
cooperation with multiple organizations running containers with customized configurations.

Original post: https://mauriziomoreo.com/devmachine

In this example there are some applications installed:

1. Docker
1. Oracle SQL Developer
1. Google Chrome
1. GitKraken
1. PhpStorm
1. IntelliJ IDEA CE
1. Skipper ORM Designer
1. Insomnia REST client
1. OpenSSH
1. GIT
1. OpenConnect
1. OpenShift oc Client Tools

## Configuration
There are two configuration files:
* `config.sh`: it contains the main configuration parameters, as the DevMachine container name, the VPN
host and the main folder you need to mount to preserve your contents.

* `config-user.sh`: the only one containing the specific user's parameters,
that every developer of the organization have to change.

In the `config` folder you'll find two files to customize the container before the build:
* `.bash_aliases`: put here your aliases to simplify the organization's typical operations.
* `devmachine_config.sh`: use this script to configure the container's applications for your needs.

## Docker
You can insert your Docker configurations in the `docker/daemon.json` file.

## SQL Developer
Download the `Other Platforms` package from the Oracle download page and place the archive
in the `sqldeveloper/zip` folder naming it `sqldeveloper.zip`. Put your `tnsnames.ora` file
in the `sqldeveloper/tnsadmin` folder.

## Build
Once customized the configuration files, you can build the DevMachine unsing the `build.sh` script.
When you update the applications, you'll need to change the `APP_LINK_*` parameters in `config.sh` and 
disable the cache (`DISABLE_CACHE`). There's an other cache parameter for the user configuration layer,
which is disabled by default (`DISABLE_USER_CACHE`).

## Starting the container
The `run.sh` script starts the container in background with the name setted in `DEVMACHINE_NAME`.
After the first run, execute the `apps/exec-config.sh` to perform the customizations inside 
the container interactively. Every launcher in the `apps` folder can be used now.

## Stopping the container
You can use the `stop.sh` script to stop the container or just removing it forcedly.
Every file in `$HOME_DIR` and `$DOCKER_DATA_DIR` will be preserved.

## VPN
To start the VPN, you can use the `app/exec-vpn.sh` script and let the process run (using the
shortcut `CTRL+P CTRL+Q` for instance). The authentication group and the host are configured in the
`config.sh` file.

## Bash
You can use the `app/exec-bash.sh` script to access the bash of the container.

## Automated launcher
A simple `lanuch.sh` script can be customized to run your daily set of applications.

## Bash aliases
You can configure your organization's aliases (`/config/.bash_aliases`) in order to simplify
the developer activities. When you change it after the first build, you'll need to
repeat the build process, and you can do it activating the layer cache (`DISABLE_CACHE=0` in `config.sh`).
Every file in the `config` folder will be copied into the container.

## Maintaining
To update the container, you can set a new version number in the `DEVMACHINE_IMAGE_NAME` parameter.
Remember to run the configuration script after the build.

## TODO
1. Schedule the builds for updates.
1. Optimize the customization.
