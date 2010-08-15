#!/bin/bash
mkisofs -o /d/slackware.iso \
-R -J -V "Slackware Install" \
-hide-rr-moved \
-v -d -N -no-emul-boot -boot-load-size 4 -boot-info-table \
-sort isolinux/iso.sort \
-b isolinux/isolinux.bin \
-c isolinux/isolinux.boot \
-A "Slackware Install CD" . 
