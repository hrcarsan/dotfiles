#!/bin/sh

sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim python-dev python-pip python3-dev python3-pip

sudo pip2 install --upgrade pip
sudo pip3 install --upgrade pip
sudo pip2 install --upgrade neovim
sudo pip3 install --upgrade neovim
