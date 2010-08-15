#!/bin/bash

#sudo rsync -ncvrlpgo --super --exclude='Music*' --exclude='Movies*' /Users/jking/ jking@192.168.0.16:/Users/jking/ > ~/rsync.log
#sudo rsync -ncvrlpgo --super --delete --ignore-errors --exclude='Users*' --exclude='Volumes*' --exclude='private*' / jking@192.168.0.16:/ > ~/rsync.log
sudo rsync -ncvrlpgo --super --delete --ignore-errors --ignore-existing --exclude='Users*' --exclude='Volumes*' --exclude='private*' / jking@192.168.0.16:/ > ~/rsync.log
