#!/bin/bash
#git user is ming543@gmail.com aa22
#git clone script
git clone https://github.com/ming543/HW_test_script.git /run/initramfs/memory/data/HW_test_script/
#git clone server
git clone https://github.com/ming543/master_setup.git /run/initramfs/memory/data/master_setup/
#git clone slave
git clone https://github.com/ming543/slave_setup.git /run/initramfs/memory/data/slave_setup/
#save pass
git config --global credential.helper store

