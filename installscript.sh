#! /bin/bash

#Neovim repository
add-apt-repository -y ppa:neovim-ppa/stable
#Seafile repositories
add-apt-repository -y ppa:seafile/seafile-client
#Kodi stable repository
sudo add-apt-repository ppa:team-xbmc/ppa

# Update repositories
apt update
# Upgrade software
apt -y upgrade

# Install a bunch of packages
apt install -y vim synapse redshift-gtk chromium-browser pepperflashplugin-nonfree indicator-multiload keepass2 pithos clementine git cowsay xdotool ssh sshfs screenfetch mtpfs kodi gimp neovim zsh seafile-gui ncdu tree

# Clean up unnecessary dependencies
apt -y autoremove
