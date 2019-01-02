#!/bin/bash
# REVISON:R3 
# Script for gamming system function test by EFCO Sam

#For Debug
#set -xv
USB_BURN=/run/initramfs/memory/data/HW_test_script
TEMP_LOG=/run/initramfs/memory/data/HW_test_script/tmp
USB_LOG=/run/initramfs/memory/data/logfile
BI_LOG=/tmp/BiTLog2.log
SN_TMP=/run/initramfs/memory/data/HW_test_script/tmp/sn.tmp
#USB_BURN=/mnt/live/memory/data/burnintest
#USB_LOG=/mnt/live/memory/data/logfile
. ./lib/cpu_temp_check.lib

#input spec of BI  to script ex.disk

#input spec of cpu temp to script ex.30
clear
cpu_temp_check 40
if ["$?" -ne 0] ; then 
cat $TEMP_LOG/temp.tmp | grep "ed!" >> $USB_LOG/$SN_LOG.log
exit 1
fi	

