#!/bin/bash
# REVISON:R3 
# Script for gamming system function test by EFCO Sam
BI_LOG=/tmp/BiTLog2.log
USB_BURN=/run/initramfs/memory/data/HW_test_script/tools/BI
USB_RUN=/run/initramfs/memory/data/HW_test_script
USB_LOG=/run/initramfs/memory/data/logfile
#USB_BURN=/mnt/live/memory/data/burnintest
#USB_LOG=/mnt/live/memory/data/logfile
#---Create burnintest script file
#	---Run burnintest
#---Create burnintest script file
BURNIN(){
	echo SETSERIAL '"'"$SN"'"' >> sn.bits
	#echo SETMACHINETYPE '"'"Giant"'"' >> sn.bits
	echo SETLOG '"'"$USB_LOG/$SN_LOG.log"'"' >> sn.bits
	echo LOAD '"'"$USB_BURN/$CFG"'"' >> sn.bits
	echo RUN CONFIG >> sn.bits
	echo SLEEP 1000 >> sn.bits
	echo EXIT >> sn.bits 
#	---Run burnintest
	$USB_BURN/burnintest.sh -S sn.bits
}

CHK_DISK(){
	read -p "Test with HDD? - (Y/N)" TYN
	if [ "$TYN" == "N" -o "$TYN" == "n" ]; then
	CFG=food.cfg
	elif [ "$TYN" == "Y" -o "$TYN" == "y" ]; then
        CFG=food_disk.cfg
	else
	echo "Please input Y or N"
	sleep 3
	exit 0
	fi                
}

rm -r $BI_LOG
rm -r $USB_BURN/cmdline_config.txt
#echo "Please choose config for Burnin disk|nodisk"
#read -p "Input your choice: " choice
#case $choice in
case $1 in
	"disk")
		cp $USB_BURN/cmdline_config.disk $USB_BURN/cmdline_config.txt
		;;
	"nodisk")
		cp $USB_BURN/cmdline_config.nodisk $USB_BURN/cmdline_config.txt
		;;
	*)
		"Usage {disk|nodisk|}"
		;;
esac

$USB_BURN/bit_cmd_line_x64

BICHK=$(grep "TEST RUN PASSED" "$BI_LOG" | cut -c 20-21} )
	if [ "$BICHK" != "PASSED" ]
	then
		clear
		sh fail_red.sh
		echo " ****** BI test check ******" | tee -a $BI_LOG
		read -p "Press any key to stop test." key
		kill -9 $? 
		cat $BI_LOG
	else
		echo "****** The BI test pass! ******" | tee -a $BI_LOG
		echo " " | tee -a $BI_LOG
	fi





