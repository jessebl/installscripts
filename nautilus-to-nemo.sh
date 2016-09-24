#! /bin/bash

#http://www.webupd8.org/2014/04/install-nemo-220-with-unity-patches-in.html
add-apt-repository -y ppa:webupd8team/nemo
apt-get update
apt-get install -y nemo nemo-fileroller
apt-get update
apt-get upgrade -y nemo nemo-fileroller
killall nemo

# https://itsfoss.com/install-nemo-default-file-manager-ubuntu-1304/
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.nemo.desktop show-desktop-icons true
