#!/bin/bash

#This script is to run on completion of torrents, and act on directories that group the torrents by label. To that end, make sure that you label your torrents and have your torrent client set to append the label to the savepath.

# Set source directories
t=/home/jesse/Downloads/Torrents/ # Allows for shorthanding the movies and tv files, since they should both have the same parent folder
tmovies=$t\Movies
ttv=$t\TV\ Shows

