#!/bin/bash
# REVISON:R3 
# Script for gamming system function test by EFCO Sam

USB_BURN=/run/initramfs/memory/data/HW_test_script
TEMP_LOG=/run/initramfs/memory/data/HW_test_script/tmp
USB_LOG=/run/initramfs/memory/data/logfile
SN_TMP=/run/initramfs/memory/data/HW_test_script/tmp/sn.tmp
#USB_BURN=/mnt/live/memory/data/burnintest
#USB_LOG=/mnt/live/memory/data/logfile


#---Get SN---
SN_GET(){
	rm -f $SN_TMP
	read -p "Please input serial number: " SN 
	echo $SN-$(date '+%Y%m%d%H%M%S') > $SN_TMP
	SN_LOG=$(<$SN_TMP)
        echo SN_NAME: $SN_LOG >> $USB_LOG/$SN_LOG.log	
}



#---Start Function---
SN_GET
#input spec of cpu temp to script ex.30
./cpu_temp_check.sh 50
cat $TEMP_LOG/temp.tmp >> $USB_LOG/$SN_LOG.log	
#input spec of memory (MByte) to script ex.8000
./memory_check.sh 5833
cat $TEMP_LOG/mem.tmp >> $USB_LOG/$SN_LOG.log	
#input spec of disk size and speed to script
./disk_test.sh 110 200
cat $TEMP_LOG/disk.tmp >> $USB_LOG/$SN_LOG.log	

#BURNIN
#LOG_CHECK






