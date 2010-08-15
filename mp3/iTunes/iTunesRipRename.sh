#!/bin/bash

# Execute from direcory containing Artist folder
# eg. ./iTunesRipRename.sh "Artist"
# Expects files to be in the structure: Artist/Album/TrackNo Title.mp3"

for X in `ls -aR "$1" | tr " " "~"`; do 
  `echo $X | grep ":" > /dev/null`
  if [ $? -eq 0 ]; then
    BASE=`echo $X | tr -d ":" | tr "~" " "` 
    PREFIX=`echo $X | sed "s/\// - /" | tr -d ":" | tr "~" " "`
  fi 

  `echo $X | grep "m[p3|4p]" > /dev/null` 
  if [ $? -eq 0 ]; then
    Y=`echo $X | sed "s/~/ - /" | tr "~" " "`

    A="$BASE/`echo $X | tr "~" " "`" 
    B="$PREFIX - $Y"
    mv -v "$A" "$B"
  fi
done
