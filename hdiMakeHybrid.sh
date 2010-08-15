#!/bin/bash

hdiutil makehybrid -iso \
  -o WinXP_SP2.iso WinXP_SP2 \
  -eltorito-boot WinXPBoot.img \
  -no-emul-boot \
  -boot-load-seg 07C0 \
  -boot-load-size 4 \
  -default-volume-name WXPVOL_EN 
