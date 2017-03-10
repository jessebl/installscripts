#!/bin/bash

# This program changes the default shell to zsh and applies my configuration in
# configs/.zshrc
set -e

# Changes shell to zsh
# Taken from https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH#installing-zsh
chsh -s $(which zsh)

# Install Oh-My-ZSH
if [[ `uname` == 'Darwin' ]]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

# Copies over zsh config file
cp configs/.zshrc $HOME/.zshrc
echo "The zsh settings have been applied."
echo "Open a new terminal to use zsh. You may have to log out and back in again."
