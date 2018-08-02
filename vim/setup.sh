#!/bin/bash

# nvim settings folders/files
[ -d ~/.config ] || mkdir ~/.config
[ -d ~/.config/nvim ] || ln -s ~/dotfiles/vim ~/.config/nvim

# install vim-plug for nvim
[ -f ~/.local/share/nvim/site/autoload/plug.vim ] || curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vim settings folders/files
[ -d ~/.vim ] || ln -s ~/dotfiles/vim  ~/.vim
[ -f ~/.vimrc ] || ln -s ~/dotfiles/vim/.vimrc ~/

# install vim-plug for vim
[ -f ~/.vim/autoload/plug.vim ] || curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +qall

echo "Finish!"
