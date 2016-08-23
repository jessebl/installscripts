#! /bin/bash

user=jesse

# Numix theme PPA
apt-add-repository -y ppa:numix/ppa
#Dropbox Keyserver (for securiry)
apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
#Dropbox Repository
add-apt-repository -y "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"

# Update repositories
apt update
# Upgrade software
apt -y upgrade

# Install a bunch of packages
apt install -y vim synapse redshift-gtk chromium-browser pepperflashplugin-nonfree synaptic unity-tweak-tool indicator-multiload keepass2 dropbox numix-icon-theme-circle compizconfig-settings-manager compiz-plugins-extra pithos clementine git cowsay xdotool ssh sshfs screenfetch mtpfs kodi steam libnotify-bin notifyosdconfig gimp calibre

# Clean up unnecessary dependencies
apt -y autoremove

# Set library path for Calibre (e-book software) (I am not sure if this works or not. Calibre command-line documentation is reallly terrible.)
calibredb --library-path /home/$user/.calibre-library

# Copy theme files from ultra-flat-steftrikia
cp ultra-flat-steftrikia /usr/share/themes/Ultra\ Flat\
