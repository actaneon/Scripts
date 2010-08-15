#!/bin/bash

if [ "$1" = "on" ]; then
  echo "Dashboard on"
  defaults write com.apple.dashboard mcx-disabled -boolean NO 
  killall Dock
elif [ "$1" = "off" ]; then
  echo "Dashboard off"
  defaults write com.apple.dashboard mcx-disabled -boolean YES
  killall Dock
else
  echo "Usage: $0 [on|off]"
fi
