#!/bin/bash
# This script sets up a new .vimrc, as well as Vundle for the plugin manager. The plugins include airline (with patched fonts).

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp configs/.vimrc ~/.vimrc
git clone https://github.com/powerline/fonts.git
./fonts/install.sh
rm -rf fonts
vi +PluginInstall +qall
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
sed -i[no-transparency.vim] 's/ctermfg=252 ctermbg=233/ctermfg=252\ ctermbg=none/g' ~/.vim/bundle/molokai/colors/molokai.vim
