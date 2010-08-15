#!/bin/bash

tar cjpvf \
  /Volumes/LACIE/Locke_`date +%Y%m%d`.tbz \
  --exclude="*/.Trash*" \
  --exclude="*/.rvm*" \
  --exclude="*/Desktop*" \
  --exclude="*/Downloads*" \
  --exclude="*/Dropbox*" \
  --exclude="*/Movies*" \
  --exclude="*/Music*" \
  --exclude="*/Pictures*" \
  --exclude="*/Library/Caches*" \
  --exclude="*/Library/Fonts*" \
  /Users/jking/ 
