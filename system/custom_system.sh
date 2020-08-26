#!/bin/bash
#base on lubuntu 18.04
SYS_LOC=/home/production/hw_test/system

sudo cp $SYS_LOC/grub.bak /etc/default/grub
sudo cp $SYS_LOC/getty@.service /lib/systemd/system/getty@.service
sudo cp $SYS_LOC/start.sh /etc/profile.d/start.sh
sudo cp $SYS_LOC/sudoers.bak /etc/sudoers



sudo update-grub

