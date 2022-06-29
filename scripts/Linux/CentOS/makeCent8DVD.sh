#!/bin/bash
logDate1=$(date +%Y%m%d%H%M)
cd gitLocal/CentOS-8-Stream-DVD/dvd/
xorriso -as mkisofs -v -J -o "/mnt/hgfs/Download/ISOs/CentOS/$logDate1-CentOS-Stream-8-x86_64-Custom-dvd.iso" -V "CentOS8x64-Custom" \
-publisher "Tekn0logy" -b "isolinux/isolinux.bin" -c "isolinux/boot.cat" \
-no-emul-boot -boot-load-size 4 -boot-info-table -R -m TRANS.TBL -graft-points "/home/tekn0logy/gitLocal/CentOS-8-Stream-DVD/dvd"
cd ~/
