#!/bin/bash
# REVISON:R3 
# Script for gamming system function test by EFCO Sam

#---Check Touch panel function
TOUCH(){
	clear
	echo "Please Check touch panel."
	read -p "Touch work - [Enter], Touch Fail - [N]" UYN
	if [ "$UYN" == "N" -o "$UYN" == "n" ]; then
	echo "Touch fail!" 
	echo "Touch fail!" >> "$USB_LOG/$SN_LOG.log"
	else
	echo "Touch OK! "
	echo "Touch OK! "  >> "$USB_LOG/$SN_LOG.log"
	fi
}

