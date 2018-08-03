#!/bin/bash

# settings folders/files
[ -d ~/.config ] || mkdir ~/.config
[ -d ~/.config/nvim ] || ln -s ~/dotfiles/vim ~/.config/nvim

# vim-plug
[ -f ~/.local/share/nvim/site/autoload/plug.vim ] || curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +qall

# install ripgrep
cd /tmp
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
sudo dpkg -i ripgrep_0.8.1_amd64.deb

# install uctags
cd /tmp
sudo apt install -y autoconf pkg-config
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure
make
make install

echo "Finish!"
