#!/bin/sh -e
set -o nounset

cd $HOME
ln -s dotfiles/.vimrc .vimrc
ln -s dotfiles/.gvimrc .gvimrc
ln -s dotfiles/.zshrc .zshrc
ln -s dotfiles/.common_funcs .common_funcs
ln -s dotfiles/.common_funcs_linux .common_funcs_linux
ln -s dotfiles/.common_funcs_darwin .common_funcs_darwin
ln -s dotfiles/.pythonstartup .pythonstartup

cd dotfiles
git submodule init
git submodule update
cd $HOME
ln -s dotfile/.vim/ .vim
