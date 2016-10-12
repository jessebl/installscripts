#! /bin/bash

# This script installs the theme ultra-flat-steftrikia from this repo.

# Copy the theme files to the user's themes directory
cp ultra-flat-steftrikia $HOME/.themes/ultra-flat-steftrikia

# Applies the theme
gsettings set org.gnome.desktop.interface gtk-theme ultra-flat-steftrikia
