#!/bin/bash

if [ "$(id -u)" != "0" ]; then
   echo "Run with sudo"
   exit 1
fi

# Install dependecies
apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip

cd /usr/local/src
export NVIM_VERSION=0.3.1
wget https://github.com/neovim/neovim/archive/v$NVIM_VERSION.tar.gz
tar -xzvf v$NVIM_VERSION.tar.gz
cd neovim-$NVIM_VERSION/
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=/usr/local/neovim-$NVIM_VERSION -DCMAKE_BUILD_TYPE=RelWithDebInfo"
make install
rm /usr/bin/nvim
ln -s /usr/local/neovim-$NVIM_VERSION/bin/nvim /usr/bin/nvim
cd ..
rm -r v$NVIM_VERSION.tar.gz neovim-$NVIM_VERSION

# configure python
apt-get install -y python-dev python-pip python3-dev python3-pip

sudo -H pip2 install --upgrade pip
sudo -H pip3 install --upgrade pip
sudo -H pip2 install --upgrade neovim
sudo -H pip3 install --upgrade neovim
