#!/bin/bash
# REVISON:R3 
# Script for gamming system function test by EFCO Sam

TEMP_LOG=/run/initramfs/memory/data/HW_test_script/tmp/vga.tmp
OUT=VGA-0
#---Check vga function
rm -r $TEMP_LOG
xrandr --output $OUT --auto
clear
echo "Please Check $OUT output."
read -p "$OUT display work - [Enter], $OUT Fail - [N]" UYN
	if [ "$UYN" == "N" -o "$UYN" == "n" ]; 
	then
		clear
		sh fail_red.sh
		echo "****** The $OUT test failed! ******" | tee -a $TEMP_LOG
		read -p "Press any key to stop test." key
		kill -9 $? 
	else
		echo "****** The $OUT test passed! ******" | tee -a $TEMP_LOG 
	fi


