#! /bin/bash

#Neovim repository
add-apt-repository -y ppa:neovim-ppa/unstable
#Seafile repositories
add-apt-repository -y ppa:seafile/seafile-client

# Update repositories
apt update
# Upgrade software
apt -y upgrade

# Install a bunch of packages
apt install -y vim synapse redshift-gtk chromium-browser pepperflashplugin-nonfree unity-tweak-tool indicator-multiload keepass2 compizconfig-settings-manager compiz-plugins-extra pithos clementine git cowsay xdotool ssh sshfs screenfetch mtpfs kodi libnotify-bin notifyosdconfig gimp neovim zsh seafile-gui

# Clean up unnecessary dependencies
apt -y autoremove
