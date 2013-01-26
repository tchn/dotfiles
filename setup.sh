#!/bin/bash -e
set -o nounset

basedir=~/dotfiles

cd "$basedir"
git submodule init
git submodule update

cd $HOME
ln -s dotfiles/.vimrc .vimrc
ln -s dotfiles/.gvimrc .gvimrc
ln -s dotfiles/.zshrc .zshrc
ln -s dotfiles/.common_funcs .common_funcs
ln -s dotfiles/.common_funcs_linux .common_funcs_linux
ln -s dotfiles/.common_funcs_darwin .common_funcs_darwin
ln -s dotfiles/.pythonstartup .pythonstartup
ln -s dotfiles/.vim/ .vim
ln -s dotfiles/.gdbinit .gdbinit

vimdir="${basedir}/.vim/"
colorsdir="${vimdir}/colors/"
mkdir -p "$colorsdir"

cd "$vimdir"

IFS=$'\n'
clsfiles=(`find . -path "./bundle/*/colors/*.vim"`)

for j in ${clsfiles[@]};do
    target=$(basename "$j");
    ln -s "${vimdir}${j}" "${colorsdir}${target}"
done

cd "$basedir"
