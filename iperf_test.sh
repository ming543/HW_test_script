#!/bin/bash
# REVISON:R3 
# Script for gamming system function test by EFCO Sam

USB_RUN=/run/initramfs/memory/data/script
HOST=192.168.1.254
IPERF=100
LOG=iperf.log

#USB_BURN=/mnt/live/memory/data/burnintest
#USB_LOG=/mnt/live/memory/data/logfile
#---Check Disk---
LOG_SPACE(){
	echo " " >> $USB_RUN/$LOG
	echo "*************************************************************************************" >> $USB_RUN/$LOG
	echo " " >> $USB_RUN/$LOG
}


#---Check CPU TEMP	
rm -r $USB_RUN/$LOG
LOG_SPACE
./iperf -c $HOST | tee -a $USB_RUN/$LOG

MCHK=$(grep "sec" "$USB_RUN/$LOG" | cut -c 28)
TCHK=$(grep "sec" "$USB_RUN/$LOG" | cut -c 24-26)
if [ $MCHK = M ]
then
	while [ $TCHK -le $IPERF ]
	do
	echo "IPERF speed lower then "$IPERF" MBytes, please check!"
	echo " "
	cat $LOG
	exit 
	done
else
	echo "IPERF speed lower then "$IPERF" MBytes, please check!"
	echo " "
	cat $LOG
	exit
fi










