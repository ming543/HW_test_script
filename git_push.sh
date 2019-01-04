#!/bin/bash
#git user is ming543@gmail.com samle

#git clone script
##git clone https://github.com/ming543/HW_test_script.git /run/initramfs/memory/data/HW_test_script/

#save pass
#git config --global credential.helper store

#pull data
#git pull

#add all modifed file
git add .

#add command
git commit -m "$1"

#update to server
git push

