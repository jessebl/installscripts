#!/bin/bash

# This program changes the default shell to zsh and applies my configuration in
# configs/.zshrc

# Changes shell to zsh
# Taken from https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH#installing-zsh
chsh -s $(which zsh)

# Install Oh-My-ZSH
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Copies over zsh config file
cp configs/.zshrc $HOME/.zshrc
echo "The zsh settings have been applied."
echo "Open a new terminal to use zsh. You may have to log out and back in again."
