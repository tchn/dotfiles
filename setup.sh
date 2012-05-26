#!/bin/sh -e
set -o nounset

cd $HOME
ln -s .vimrc dotfiles/.vimrc
ln -s .gvimrc dotfiles/.gvimrc
ln -s .zshrc dotfiles/.zshrc
ln -s .common_funcs dotfiles/.common_funcs
ln -s .common_funcs_linux dotfiles/.common_funcs_linux
ln -s .common_funcs_darwin dotfiles/.common_funcs_darwin
ln -s .pythonstartup dotfiles/.pythonstartup

cd dotfiles
git submodule init
git submodule update
cd $HOME
ln -s .vim dotfile/.vim/
