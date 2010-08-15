#!/bin/bash

cat "iTunes Music Library.xml" | grep "Location"  | cut -d ">" -f4- | cut -d "<" -f1 > MP3FileList.txt
