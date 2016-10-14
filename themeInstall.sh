#! /bin/bash

# This script installs 1) the gtk theme ultra-flat-steftrikia from this repo, and 2) the icon theme Paper from its git repo

# Copy the theme files to the user's themes directory
cp ultra-flat-steftrikia $HOME/.themes/ultra-flat-steftrikia

# Applies the theme
gsettings set org.gnome.desktop.interface gtk-theme ultra-flat-steftrikia

# Get the files for Paper icon theme
git clone https://github.com/snwh/paper-icon-theme.git

# Install the icons
mv paper-icon-theme/Paper /home/jesse/.local/share/icons/Paper
rm -rf paper-icon-theme

# Apply the icon theme
gsettings set org.gnome.desktop.interface icon-theme Paper
