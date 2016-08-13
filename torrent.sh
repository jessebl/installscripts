#!/bin/bash

#This script is to run on completion of torrents, and act on directories that group the torrents by label. To that end, make sure that you label your torrents and have your torrent client set to append the label to the savepath.
# Dependencies: filebot

# Set source directories
s=/home/jesse/Downloads/Torrents/ # Allows for shorthanding the movies and tv files, since they should both have the same parent folder
smovies=$s\Movies
stv=$s\TV\ Shows

# Set destination directories
d=/home/jesse/test/targ/
dmovies=$d\Movies
dtv=$d\TV\ Shows

# Use filebot to write to destination with proper formatting, from the source directories
## Movies
### Movies are copied to $dmovies inside directories named with the movie titles. Actual files are named "title-year"
filebot -rename --action copy $smovies\/* --format "{home}/test/targ/Movies/{n}\ ({y})/{n}\ ({y})" -non-strict