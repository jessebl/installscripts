#!/bin/bash

# Do you want to alias vi/vim to nvim?
aliasing = true

if [aliasing = true] ; then
	if ! grep -q nvim ~/.bash_aliases; then
		echo "alias vi='nvim' \n alias vim='nvim'" >> ~/.bash_aliases
	fi
fi

# This section links nvim to vim's configuration

mkdir ~/.config/nvim
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
