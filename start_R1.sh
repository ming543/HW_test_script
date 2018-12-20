#!/bin/bash

USB_BURN=/mnt/live/memory/data/burnintest
USB_LOG=/mnt/live/memory/data/logfile

#---Check Disk---

read -p "Test with HDD? - (Y/N)" TYN

if [ "$TYN" == "N" -o "$TYN" == "n" ]; then
	CFG=food.cfg
elif [ "$TYN" == "Y" -o "$TYN" == "y" ]; then
        CFG=food_disk.cfg
else
echo "Please choose Yes or No"
sleep 3
exit 0
fi                
                

#---Get SN---
rm -f sn.bits
read -p "Please input serial number: " SN


#---Create burnintest script file
echo SETSERIAL '"'"$SN"'"' >> sn.bits
#echo SETMACHINETYPE '"'"Giant"'"' >> sn.bits
echo SETLOG '"'"$USB_LOG/$SN.log"'"' >> sn.bits
echo LOAD '"'"$USB_BURN/$CFG"'"' >> sn.bits
echo RUN CONFIG >> sn.bits
echo EXIT >> sn.bits 

#---Run burnintest
rm -f $USB_LOG/$SN.log
$USB_BURN/burnintest.sh -S sn.bits

#---Check CPU TEMP	
sensors -A >> "$USB_LOG/$SN.log"
clear
sensors -A
read -p "Is the CPU TEMP under 40° ?Press [Enter] key to continue..." 

#---Check Touch panel function
clear
echo "Please Check touch panel."
read -p "Touch work - [Enter], Touch Fail - [N]" UYN
 
if [ "$UYN" == "N" -o "$UYN" == "n" ]; then
	echo "Touch fail!" 
	echo "Touch fail!" >> "$USB_LOG/$SN.log"
else
	echo "Touch OK! "
	echo "Touch OK! "  >> "$USB_LOG/$SN.log"
fi

#---Check test result
clear
echo "-------------------"
grep "TEST RUN" $USB_LOG/$SN.log
echo "-------------------"

read -p "Please check the TEST RUN "PASSED" or "FAILED" ? Press [Enter] key to shutdown..." 
	poweroff

