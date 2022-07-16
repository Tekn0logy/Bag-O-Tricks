#!/bin/bash
publishDate=$(date +%Y%m%d%H%M)
cd ~/gitLocal/CentOS-8-Stream-DVD/
cp -av ~/gitLocal/CentOS-Installers/8/isolinux/isolinux.cfg ~/gitLocal/CentOS-8-Stream-DVD/dvd/isolinux/
cp -av ~/gitLocal/CentOS-Installers/8/EFI/BOOT/* ~/gitLocal/CentOS-8-Stream-DVD/dvd/EFI/BOOT/
cp -av ~/gitLocal/CentOS-Installers/8/bootConfigs ~/gitLocal/CentOS-8-Stream-DVD/dvd/
xorriso -as mkisofs -v -x -J -R -o "/mnt/hgfs/Download/ISOs/CentOS/$publishDate-CentOS-Stream-8-x86_64-Custom-dvd.iso" \
-V "CentOS8x64-Custom" -publisher "Tekn0logy <https://github.com/Tekn0logy>" \
-b "isolinux/isolinux.bin" -c "isolinux/boot.cat" -no-emul-boot -boot-load-size 4 -boot-info-table \
-eltorito-alt-boot -e images/efiboot.img -no-emul-boot -isohybrid-gpt-basdat -m TRANS.TBL -graft-points "dvd"
# cd ~/
