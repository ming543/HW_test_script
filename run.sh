#!/bin/bash
# utilitymenu.sh - A sample shell script to display menus on screen
# Store menu options selected by the user
INPUT=/tmp/menu

# Storage file for displaying cal and date command output
OUTPUT=/tmp/output

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
--menu "使用上下或數字1-9鍵選取測試項目\nBuild by EFCO Sam Lee" 20 50 8 \
1 "Test U7-100" \
2 "Test U7-200" \
3 "Test U7-300" \
Exit "Exit to the shell" 2>"${INPUT}"

menuitem=$(<"${INPUT}")
#response=$?

# make decsion 
case $menuitem in
#case $response in
	1) 
		clear
		cd /home/production/hw_test/
		sh u7-100 
		exit 0
		;;
	2) 
		echo "2"
		exit 2
		;;
	3) 
		echo "3"
		exit 3
		;;
	Exit) echo "Bye";  exit 0;;
	#Exit) lxterminal; clear; break;;
esac

#done


