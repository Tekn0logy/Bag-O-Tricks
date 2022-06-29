#!/bin/bash
if ! [ -d ~/working/dvd ]; then
   sudo mkdir -vp ~/working/dvd
fi

sudo mount -vo ro /mnt/hgfs/Download/ISOs/CentOS/CentOS-Stream-8-x86_64-latest-dvd1.iso ~/working/dvd
shopt -s dotglob
cp -arv --sparse=always ~/working/dvd/ ~/gitLocal/CentOS-8-Stream-DVD/
touch ~/gitLocal/CentOS-8-Stream-DVD/.gitignore
sudo umount -v ~/working/dvd
