#!/bin/sh

# nvim settings folders/files
[ -f ~/.config ] || mkdir ~/.config
[ -f ~/.config/nvim ] || ln -s ~/dotfiles/vim ~/.config/nvim

# install vim-plug for nvim
[ -f ~/.local/share/nvim/site/autoload/plug.vim ] || curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vim settings folders/files
[ -f ~/.vim ] || mkdir ~/.vim
[ -f ~/.vimrc ] || ln -s ~/dotfiles/vim/.vimrc ~/

# install vim-plug for vim
[ -f ~/.vim/autoload/plug.vim ] && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
