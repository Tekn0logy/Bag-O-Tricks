#!/bin/bash
if ! [ -d ~/working/dvd ]; then
   mkdir -vp ~/working/dvd
fi

if [ -d ~/gitLocal/CentOS-8-Stream-DVD/ ]; then
   sudo rm -rf ~/gitLocal/CentOS-8-Stream-DVD/.??*
else
   mkdir -vpm 775 ~/gitLocal/CentOS-8-Stream-DVD/
fi

sudo mount -vo ro /mnt/hgfs/Download/ISOs/CentOS/CentOS-Stream-8-x86_64-latest-dvd1.iso ~/working/dvd
shopt -s dotglob
cp -arv --sparse=always ~/working/dvd/* ~/gitLocal/CentOS-8-Stream-DVD/
cp -arv --sparse=always ~/working/dvd/.??* ~/gitLocal/CentOS-8-Stream-DVD/
touch ~/gitLocal/CentOS-8-Stream-DVD/.gitignore
sudo umount -v ~/working/dvd

sudo chmod -vR ug+w ~/gitLocal/CentOS-8-Stream-DVD/isolinux/ ~/gitLocal/CentOS-8-Stream-DVD/EFI/BOOT/
sudo mkdir -vpm 755 ~/gitLocal/CentOS-8-Stream-DVD/bootConfigs
sudo chown -v $USER:$USER ~/gitLocal/CentOS-8-Stream-DVD/bootConfigs
