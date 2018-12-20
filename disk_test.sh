#!/bin/bash
# REVISON:R3 
# Script for gamming system function test by EFCO Sam

USB_BURN=/run/initramfs/memory/data/burnintest/64bit
USB_RUN=/run/initramfs/memory/data/script
USB_LOG=/run/initramfs/memory/data/logfile
DEVICE=/dev/sda1
DISK_SIZE=119
DISK_SPEED=200
TEMP_LOG=/run/initramfs/memory/data/script/disk.tmp

#USB_BURN=/mnt/live/memory/data/burnintest
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
	while [ $DCHK -le $DISK_SIZE ]
	do
	echo "Disk size is "$DCHK $GCHK" Bytes, SEPC is "$DISK_SIZE $GCHK

	exit 
	done
else
	echo "Disk size is "$DCHK $GCHK" Bytes, SPEC is "$DISK_SIZE $GCHK
	exit
fi
}

DISK_SPEED_CHK(){
MCHK=$(grep "buffered" $TEMP_LOG | cut -c 63)
DCHK=$(grep "buffered" $TEMP_LOG | cut -c 55-58)
if [ $MCHK = M ]
then
	while [ $DCHK -le $DISK_SPEED ]
	do
	echo "Disk speed is "$DCHK $MCHK" Bytes, SPEC is "$DISK_SPEED $MCHK
	exit 
	done
else
	echo "Disk speed is "$DCHK $MCHK" Bytes, SPEC is "$DISK_SPEED $MCHK
	exit
fi
}

rm -r $TEMP_LOG
DISK_INFO
#DISK_READ
DISK_SIZE_CHK
DISK_SPEED_CHK



