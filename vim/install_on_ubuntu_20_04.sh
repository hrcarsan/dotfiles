#!/bin/bash

sudo apt install -y neovim

# configure python
sudo add-apt-repository universe
cd /tmp
sudo apt install -y python2 python3 python3-pip
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
sudo python2 get-pip.py
pip3 --version
pip2 --version
sudo -H pip2 install --upgrade pip
sudo -H pip3 install --upgrade pip
sudo -H pip2 install --upgrade neovim
sudo -H pip3 install --upgrade neovim
sudo -H pip3 install --upgrade pynvim

# configure node.js
sudo npm install -g neovim

# install ripgrep
cd /tmp
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb
sudo dpkg -i ripgrep_12.1.1_amd64.deb
rg --version

# install uctags
cd /tmp
sudo apt install -y autoconf pkg-config libjansson-dev
git clone https://github.com/universal-ctags/ctags.git --depth=1
cd ctags
./autogen.sh
./configure
make
sudo make install
ctags --version

# settings folders/files
[ -d ~/.config ] || mkdir ~/.config
[ -d ~/.config/nvim ] || ln -s ~/dotfiles/vim ~/.config/nvim

# vim plug and plugin installation
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall

sudo ln -sf /usr/bin/nvim /usr/bin/vim
