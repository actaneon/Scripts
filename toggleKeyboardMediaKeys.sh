#!/bin/bash

X=`launchctl list | grep rcd`

if [ $? -eq 0 ]
then
  launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist
  echo Disabled
else
  launchctl load -w /System/Library/LaunchAgents/com.apple.rcd.plist
  echo Enabled
fi
