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
dialog --clear --title "[ Q7XX serial PCBA - M E N U ]" \
--menu "Use 1-9 choose test item \nBuild by EFCO SamLee REV:$REV" 20 50 8 \
1 "Q718PAS-T2" \
b "Back to Main Menu" \
2>$INPUT
#2>"${INPUT}"

#2 "Q718-T2" \
#3 "Q715-T2" \
menuitem=$(cat $INPUT)
#response=$?
# make decsion 

case $(cat $INPUT) in
	1)
		clear
		cd /home/production/hw_test/
		sudo sh Q718PAS-T2 
		exit 1
		;;
	2) 
		echo "2"
		clear
		cd /home/production/hw_test/
		sudo sh Q718-T2 
		exit 2
		;;
	3) 
		echo "3"
		clear
		cd /home/production/hw_test/
		sudo sh Q715-T2 
		exit 3
		;;
	4) 
		echo "4"
		clear
		cd /home/production/hw_test/
		sudo sh Q718-T2 
		exit 4
		;;
	5) 
		echo "5"
		clear
		cd /home/production/hw_test/
		sudo sh Q715-T1 
		exit 5
		;;
	6) 
		echo "6"
		clear
		cd /home/production/hw_test/
		sudo sh Q715-T2 
		exit 6
		;;
	b)	
		clear
		echo "b"
		#echo "lxterminal -e /home/production/hw_test/run_main.sh" > /home/production/hw_test/x.sh
		#sudo sh /home/production/hw_test/x.sh
		echo "sudo sh /home/production/hw_test/run_main.sh" > /home/production/hw_test/t.sh
		sudo sh /home/production/hw_test/t.sh
		exit 0		
		;;	

esac

#done


