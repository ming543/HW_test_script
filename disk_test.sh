#!/bin/bash
# REVISON:R3 
# Script for gamming system function test by EFCO Sam

USB_LOG=/run/initramfs/memory/data/logfile
DEVICE=/dev/sda1
DISK_SIZE=119
DISK_SPEED=200
TEMP_LOG=/run/initramfs/memory/data/HW_test_script/tmp/disk.tmp

#USB_LOG=/mnt/live/memory/data/logfile
#---Create burnintest script file
#	---Run burnintest


DISK_INFO(){
	#hdparm -I -t $DEVICE >> disk.tmp
	hdparm -I -t $DEVICE | tee -a $TEMP_LOG
}


DISK_READ(){
	echo "dd read test $DEVICE" >> $TEMP_LOG
	dd if=$DEVICE of=/dev/nell bs=1M count=1000 >> $TEMP_LOG 2>&1
	#dd if=/dev/sda1 of=/dev/nell bs=1M count=1000 | tee -a disk.tmp 2>&1
}

DISK_SIZE_CHK(){
GCHK=$(grep "1000" $TEMP_LOG | cut -c 58)
DCHK=$(grep "1000" $TEMP_LOG | cut -c 54-56)
if [ $GCHK = G ]
then
	if [ $DCHK -le $DISK_SIZE ]
	then
		clear
		sh fail_red.sh
		echo "****** Disk size is $DCHK $GCHK Bytes, SEPC is $DISK_SIZE $GCHK, please check! ******" | tee -a $TEMP_LOG
		read -p "Press any key to stop test." key
		kill -9 $?
		echo ""
	else
		echo "****** disk size test pass! ******" | tee -a $TEMP_LOG
		echo " "
	fi
fi
}

DISK_SPEED_CHK(){
MCHK=$(grep "buffered" $TEMP_LOG | cut -c 63)
SCHK=$(grep "buffered" $TEMP_LOG | cut -c 55-58)
if [ $MCHK = M ]
then
	if [ $SCHK -le $DISK_SPEED ]
	then
		clear
		sh fail_red.sh
		echo "****** Disk speed is $SCHK $MCHK Bytes, SEPC is $DISK_SPEED $MCHK, please check! ******" | tee -a $TEMP_LOG
		read -p "Press any key to stop test." key
		kill -9 $?
		echo ""	
	else
		echo "****** disk speed test pass! ******" | tee -a $TEMP_LOG
		echo " "
	fi
fi
}

rm -r $TEMP_LOG
DISK_INFO
#DISK_READ
DISK_SIZE_CHK
DISK_SPEED_CHK



