#!/bin/bash

service=$1
action=$2

file=`ls /Users/jking/Library/LaunchAgents/ | grep memcached`
file_path="/Users/jking/Library/LaunchAgents/$file"

if [ "$2" = "start" ]; then
  echo "launchctl load $file_path"
  `launchctl load $file_path`
elif [ "$2" = "stop" ]; then
  echo "launchctl unload $file_path"
  `launchctl unload $file_path`
fi
