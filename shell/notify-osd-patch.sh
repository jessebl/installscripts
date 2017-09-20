#! /bin/bash

#PPAs for fixed libnotify and the notifyosdconfig
sudo add-apt-repository -y ppa:leolik/leolik
sudo add-apt-repository -y ppa:nilarimogard/webupd8
#For patched notify-osd
pkill notify-osd
