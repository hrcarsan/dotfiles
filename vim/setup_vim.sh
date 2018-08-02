#!/bin/bash

# vim settings folders/files
[ -d ~/.vim ] || ln -s ~/dotfiles/vim  ~/.vim
[ -f ~/.vimrc ] || ln -s ~/dotfiles/vim/.vimrc ~/

# install vim-plug for vim
[ -f ~/.vim/autoload/plug.vim ] || curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall

echo "Finish!"
