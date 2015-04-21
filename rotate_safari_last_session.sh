#!/bin/sh

#Install:
# cd /etc/periodic/daily
# sudo ln -s ~/Scripts/rotate_safari_last_session.sh 200.safari_last_session

cp /Users/jking/Library/Safari/LastSession.plist /Users/jking/Library/Safari/LastSession.plist-`date +%Y%m%d_%H%M%S`
