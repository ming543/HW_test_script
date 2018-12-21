#!/bin/bash
# REVISON:R3 
# Script for gamming system function test by EFCO Sam

USB_BURN=/run/initramfs/memory/data/HW_test_script
TEMP_LOG=/run/initramfs/memory/data/HW_test_script/tmp
USB_LOG=/run/initramfs/memory/data/logfile
BI_LOG=/tmp/BiTLog2.log
SN_TMP=/run/initramfs/memory/data/HW_test_script/tmp/sn.tmp
#USB_BURN=/mnt/live/memory/data/burnintest
#USB_LOG=/mnt/live/memory/data/logfile


#---Get SN---
SN_GET(){
	rm -f $SN_TMP
	read -p "Please input serial number: " SN 
	echo $SN-$(date '+%Y%m%d%H%M%S') > $SN_TMP
	SN_LOG=$(<$SN_TMP)
        cat $TEMP_LOG/model.tmp >> $USB_LOG/$SN_LOG.log	
        echo Serial Number: $SN >> $USB_LOG/$SN_LOG.log	
}



#---Start Function---
SN_GET
#input spec of BI  to script ex.disk
./auto_burn_cli.sh nodisk
cat $BI_LOG | grep "passed" >> $USB_LOG/$SN_LOG.log
#input spec of cpu temp to script ex.30
clear
./cpu_temp_check.sh 70
cat $TEMP_LOG/temp.tmp | grep "passed" >> $USB_LOG/$SN_LOG.log	
#input spec of memory (MByte) to script ex.8000
clear
./memory_check.sh 5833
cat $TEMP_LOG/mem.tmp | grep "passed"  >> $USB_LOG/$SN_LOG.log	
#input spec of disk size and speed to script
clear
./disk_test.sh 110 200
cat $TEMP_LOG/disk.tmp | grep "passed" >> $USB_LOG/$SN_LOG.log	
#Show pass to log
clear
echo "Serial Number:$SN "
sh pass_green.sh 
echo "****** ALL_TEST_PASSED! ****** " >> $USB_LOG/$SN_LOG.log
read -p "Press Enter to end test" end






