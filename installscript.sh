#! /bin/bash

#Neovim repository
sudo add-apt-repository -y ppa:neovim-ppa/stable
#Seafile repositories
sudo add-apt-repository -y ppa:seafile/seafile-client
#Kodi stable repository
sudo add-apt-repository ppa:team-xbmc/ppa

# Update repositories
sudo apt update
# Upgrade software
sudo apt -y upgrade

# Install a bunch of packages
sudo apt install -y vim synapse redshift-gtk chromium-browser pepperflashplugin-nonfree indicator-multiload keepass2 pithos clementine git cowsay xdotool ssh sshfs screenfetch mtpfs kodi gimp neovim zsh seafile-gui ncdu tree

# Clean up unnecessary dependencies
sudo apt -y autoremove
