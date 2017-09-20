#!/bin/bash

# Set log directory
logdir=/var/log/filebot
mkdir -p $logdir

# Set source directories
sbase=/hoarding/torrent
smovie=$sbase/movie
stv=$sbase/tv
sanime=$sbase/anime

# Set destination directories
dbase=/hoarding
dmovies=$dbase/movies
dtv=$dbase/tv
danime=$dbase/anime
mkdir -p $dbase

filebot -script fn:amc "" -rename --action hardlink {"$smovies","$stv","$sanime"} --def movieFormat="$dmovies/{n}\ ({y})/{n}\ ({y})" seriesFormat="$dtv/{n}\ ({y})/Season {s}/{n}-{s00e00}-{t}" animeFormat="$danime/{n}\ ({y})/Season {s}/{n}-{s00e00}-{t}" -non-strict --log-file $logdir/filebot.log --def excludeList=$logdir/exclude.log
