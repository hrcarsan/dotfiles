#!/bin/bash

# settings folders/files
[ -d ~/.config ] || mkdir ~/.config
[ -d ~/.config/nvim ] || ln -s ~/dotfiles/vim ~/.config/nvim

# vim-plug for nvim
[ -f ~/.local/share/nvim/site/autoload/plug.vim ] || curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +qall

echo "Finish!"
