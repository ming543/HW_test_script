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
dialog --clear --title "[ U7-XXX serial - M E N U ]" \
--menu "使用上下或數字1-9鍵選取測試項目\nBuild by EFCO SamLee REV:$REV" 20 50 8 \
1 "U7-PFT" \
2 "U7-100-T2" \
3 "U7-200" \
4 "U7-300" \
b "Back to Main Menu" \
2>$INPUT
#2>"${INPUT}"

menuitem=$(cat $INPUT)
#response=$?
# make decsion 

case $(cat $INPUT) in
	1)
		clear
		cd /home/production/hw_test/
		sudo sh U7-PFT 
		exit 0
		;;
	2) 
		echo "2"
		clear
		cd /home/production/hw_test/
		sudo sh U7-100-T2 
		exit 2
		;;
	3) 
		echo "3"
		clear
		cd /home/production/hw_test/
		sudo sh U7-200 
		exit 3
		;;
	4) 
		echo "4"
		clear
		cd /home/production/hw_test/
		sudo sh U7-300 
		exit 4
		;;
	5) 
		echo "5"
		clear
		cd /home/production/hw_test/
		sudo sh Q718-T1 
		exit 5
		;;
	6) 
		echo "6"
		clear
		cd /home/production/hw_test/
		sudo sh Q718-T2 
		exit 6
		;;
	7) 
		echo "7"
		clear
		cd /home/production/hw_test/
		sudo sh Q715-T1 
		exit 7
		;;
	8) 
		echo "8"
		clear
		cd /home/production/hw_test/
		sudo sh Q715-T2 
		exit 8
		;;
	b)	
		clear
		echo "b"
		echo "sh /home/production/hw_test/run_main.sh" > /home/production/hw_test/x.sh
		sudo sh /home/production/hw_test/x.sh
		exit 0		
		;;	

esac

#done


