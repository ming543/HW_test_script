#!/bin/bash
# REVISON:R3 
# Script for gamming system function test by EFCO Sam

SCR_LOC=/run/initramfs/memory/data/HW_test_script
HOST=192.168.1.1
#LAN1=enp3s0
LAN1=enx00e04c680030

#set timezone to Taipei
timedatectl set-timezone "Asia/Taipei"
#timedatectl set-time "2018-12-12 11:30:40"

#disable power save mode
xset s off -dpms
#set IP
ifconfig $LAN1 $HOST
#enable WLAN
#sh $SERVER_RUN/wlan_setup.sh
#start ssh server
/etc/init.d/ssh start
#start iperf server
#$USB_RUN/iperf -s $HOST &
# setup it at "crontab -e"
#@reboot /run/initrams/memory/data/server/server_start.sh











