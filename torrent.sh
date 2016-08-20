#!/bin/bash

#This script is to run on completion of torrents, and act on directories that group the torrents by label. To that end, make sure that you label your torrents and have your torrent client set to append the label to the savepath.
# Dependencies: filebot calibre

# Make log directory
mkdir -p logs

# Set source directories
s=/home/jesse/Downloads/Torrents # Allows for shorthanding the movies and tv files, since they should both have the same parent directory
smovies=$s/Movies  # Source directory for movies
stv=$s/"TV Shows" # Source directory for TV Shows
sbooks=$s/Books

# Set destination directories
d=/media/jesse/boa/Videos # Destination directory parent
dmovies=$d/Movies # Destination directory for movies
dtv=$d/"TV Shows" # Destination directory for TV Shows

# Use filebot to write to destination with proper formatting, from the source directories
## Movies
### Movies are copied to $dmovies inside directories named with the movie titles. Actual files are named "title-year"
filebot -rename --action copy "$smovies"/* --format "$dmovies/{n}\ ({y})/{n}\ ({y})" -non-strict | tee logs/filebot1.txt # filebot copies media from $smovies to $dmovies with path renaming
filebot -rename --action copy "$stv"/* --format "$dtv/{n}\ ({y})/Season {s}/{n}-{s00e00}-{t} " -non-strict | tee logs/filebot2.txt # filebot copies media from $stv to $dtv with path renaming

# [optional] Use rsync to transfer from $d to the NAS

d2=/mnt/nas-multimedia/jesse-videos # Secondary destination, transfer with rsync

rsync -avvhz --progress "$dmovies" "$d2" | tee logs/rsync1.txt # rsync transfers files from $dmovies to $d2
rsync -avvhz --progress "$dtv" "$d2" | tee logs/rsync2.txt # rsync transfers files from $dtv to $d2

# Ebooks Section
calibredb add -r "$sbooks"
