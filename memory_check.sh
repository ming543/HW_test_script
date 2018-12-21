#!/bin/bash
# REVISON:R3 
# Script for gamming system function test by EFCO Sam

DMI_LOG=/run/initramfs/memory/data/HW_test_script/tmp/dmi.tmp
MEM_LOG=/run/initramfs/memory/data/HW_test_script/tmp/mem.tmp
M=$1
#USB_BURN=/mnt/live/memory/data/burnintest
#USB_LOG=/mnt/live/memory/data/logfile

#---get dmidecode info
#rm -r $DMI_LOG
#dmidecode > $DMI_LOG
#---get memory size by M
rm -r $MEM_LOG
free -m | tee -a $MEM_LOG


TCHK=$(grep "Mem" "$MEM_LOG" | cut -c 16-19)
if [ $TCHK -ne $M ]
then
	clear
	sh fail_red.sh
	echo "****** Memory size is $TCHK MByte, the spec is $M MByte ,please check! ******" | tee -a $MEM_LOG
	read -p "Press any key to stop test." key
	kill -9 $?
	#pkill -f start.sh
	echo " "
else
	echo "****** The SPEC is $TCHK, Memory size is $TCHK MByte test passed! ******" | tee -a $MEM_LOG
	echo " " | tee -a $MEM_LOG
fi











