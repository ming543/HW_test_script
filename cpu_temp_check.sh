#!/bin/bash
# REVISON:R3 
# Script for gamming system function test by EFCO Sam

TEMP_LOG=/run/initramfs/memory/data/HW_test_script/tmp/temp.tmp
DMI_LOG=/run/initramfs/memory/data/HW_test_script/tmp/dmi.tmp
C=$1
#USB_BURN=/mnt/live/memory/data/burnintest
#USB_LOG=/mnt/live/memory/data/logfile

#---get dmidecode info
rm -r $DMI_LOG
dmidecode > $DMI_LOG

#---Check CPU TEMP	
rm -r $TEMP_LOG
sensors -A | tee -a $TEMP_LOG 
TCHK=$(grep "Core 0" "$TEMP_LOG" | cut -c 16-17)
if [ $TCHK -gt $C ]
then
	clear
	sh fail_red.sh
	echo "****** CPU temp is $TCHK C the spec is $C C, please check! ******" | tee -a $TEMP_LOG
	read -p "Press any key to stop test." key
	kill -9 $? 
	#pkill -f start.sh
	echo " "
else
	echo "****** CPU temp test pass! ******" | tee -a $TEMP_LOG
	echo " "
fi

#while [ $TCHK -gt $C ]
#do
#	clear
#	echo "CPU temp over "$C"C, please check!" | tee -a $TEMP_LOG
#	echo ""
#	sensors -A 
#	sleep 2
#	exit 0
#	done











