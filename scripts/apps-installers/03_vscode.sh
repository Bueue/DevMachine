#!/bin/bash

wget -O vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
apt install -y ./vscode.deb
rm vscode.deb