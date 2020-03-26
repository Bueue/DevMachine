#!/bin/bash

wget https://download.jetbrains.com/webide/PhpStorm-2019.3.3.tar.gz
tar xvf PhpStorm-2019.3.3.tar.gz --directory /opt/
ln -s /opt/PhpStorm-*/bin/phpstorm.sh /usr/local/bin/phpstorm
chown developer:developer /usr/local/bin/phpstorm
rm PhpStorm-2019.3.3.tar.gz