#!/bin/bash
# utilitymenu.sh - A sample shell script to display menus on screen
# Store menu options selected by the user
#set -xv
INPUT=/tmp/menu
OUTPUT=/tmp/output
REV=$(cat /home/production/hw_test/revision | head -1 | awk '{print $1}')

# if temp files found, delete em
rm $OUTPUT
rm $INPUT

#
#	local t=${3-Output} 	# box title 
#	dialog --backtitle "Linux Shell Script Tutorial" --title "${t}" --clear --msgbox "$(<$OUTPUT)" ${h} ${w}
#
#while true
#do
### display main menu ###
dialog --clear --title "[ M A I N - M E N U ]" \
--menu "Use 1-9 choose test item \nBuild by EFCO SamLee REV:$REV" 20 50 8 \
1 "U7-XXX TEST" \
2 "Q7XX PCBA TEST" \
c "Copy Log to Onedrive" \
u "Update Test Script" \
2>$INPUT
#2>"${INPUT}"

menuitem=$(cat $INPUT)
#response=$?
# make decsion 

case $(cat $INPUT) in
	1)
		clear
		#echo "lxterminal -e /home/production/hw_test/run_u7.sh" > /home/production/hw_test/x.sh
		#sudo sh /home/production/hw_test/x.sh
		echo "sudo sh /home/production/hw_test/run_u7.sh" > /home/production/hw_test/t.sh
		sudo sh /home/production/hw_test/t.sh
		exit 0
		;;
	2) 
		echo "2"
		clear
		#echo "lxterminal -e /home/production/hw_test/run_q7.sh" > /home/production/hw_test/x.sh
		#sudo sh /home/production/hw_test/x.sh
		echo "sudo sh /home/production/hw_test/run_q7.sh" > /home/production/hw_test/t.sh
		sudo sh /home/production/hw_test/t.sh
		exit 2
		;;
	3) 
		echo "3"
		clear
		echo "sh /home/production/hw_test/run_.sh" > /home/production/hw_test/x.sh
		sudo sh /home/production/hw_test/x.sh
		exit 3
		;;
	c)	
		clear
		echo "c"
		sudo timedatectl set-ntp yes
		sudo rclone copy /home/production/u7_log onedrive:General/u7_log -P
		sleep 5
		#sudo sh /home/production/hw_test/x.sh
		sudo sh /home/production/hw_test/t.sh
		exit
		;;
	u)	
		clear
		echo "u"
		cd /home/production/hw_test/
		sudo sh git_reset.sh
		sleep 5
		#sudo sh /home/production/hw_test/x.sh
		sudo sh /home/production/hw_test/t.sh
		exit 0		
		;;	

esac

#done


