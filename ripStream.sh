#!/bin/bash

if [ "x$1" = 'x' ]; then
  echo "Usage: $0 [URL]"
else
  streamripper $1 -o never -u "iTunes 9.0.1" -d ~/Music/iTunes/iTunes\ Music/streams/
fi
