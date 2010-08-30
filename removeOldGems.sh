#!/bin/bash

for X in `gem list | grep "," | tr " " "~"` 
do
    CMD=`echo $X | tr "~" " " | sed "s/\([a-z]\) (.*, \(.*\))/\1 -v \2/"`
    echo "$CMD"
    gem uninstall $CMD
done

