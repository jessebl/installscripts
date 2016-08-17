#!/bin/bash
# This script sets up a new .vimrc, as well as Vundle for the plugin manager. The plugins include airline (with patched fonts).

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp /configs/.vimrc ~/.vimrc
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
vim +PluginInstall +qall
