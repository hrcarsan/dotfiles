#!/bin/bash

if [ "$(id -u)" != "0" ]; then
   echo "Run as root"
   exit 1
fi

apt-get install -y software-properties-common
add-apt-repository ppa:neovim-ppa/stable
apt-get update
apt-get install -y neovim python-dev python-pip python3-dev python3-pip

pip2 install --upgrade pip
pip3 install --upgrade pip
pip2 install --upgrade neovim
pip3 install --upgrade neovim
