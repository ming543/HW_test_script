#!/bin/bash
# REVISON:R3 
# Script for gamming system logfile check by EFCO Sam

TEMP_LOG=/run/initramfs/memory/data/script/temp.log
C=40
#USB_BURN=/mnt/live/memory/data/burnintest
#USB_LOG=/mnt/live/memory/data/logfile


#---Check test result
LOG_CHECK(){
	PCHK=$(grep "TEST RUN" "$USB_LOG/$SN_LOG.log" | cut -c10)
	echo $PCHK
	while [ "$PCHK" != "P" ]
	do
		clear
		echo "Logfile not normal, please check!"
		echo ""
		echo "-------------------"
		grep "TEST RUN" $USB_LOG/$SN_LOG.log
		echo "-------------------"
		sleep 10
		exit 0
	done
	echo "Function Test Passed! Auto Shutdown After 2 Sec."
	sleep 3
	#poweroff

}













