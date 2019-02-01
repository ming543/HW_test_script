#!/bin/bash
#mount /dev/sdb1 /mnt
rsync -avrh --delete --exclude 'changes.dat' /run/initramfs/memory/data/ /root/pCloudDrive/slax_data/

