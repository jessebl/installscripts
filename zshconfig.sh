#!/bin/bash

# This program changes the default shell to zsh and applies my configuration in
# configs/.zshrc

# Changes shell to zsh
# Taken from https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH#installing-zsh
chsh -s $(which zsh)

# Copies over zsh config file
cp configs/.zshrc $HOME/jesse/.zshrc
echo "The zsh settings have been applied."
echo "Open a new terminal to use zsh."
