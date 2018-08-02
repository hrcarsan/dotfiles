#!/bin/bash

sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim python-dev python-pip python3-dev python3-pip

sudo -H pip2 install --upgrade pip
sudo -H pip3 install --upgrade pip
sudo -H pip2 install --upgrade neovim
sudo -H pip3 install --upgrade neovim
