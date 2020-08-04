#!/bin/bash
# utilitymenu.sh - A sample shell script to display menus on screen
# Store menu options selected by the user
#set -xv
INPUT=/tmp/menu
OUTPUT=/tmp/output
REV=$(cat /home/production/hw_test/revision | head -1 | awk '{print $1}')
TEST_LOC=/home/production/hw_test
N1=Q718PAS-T2
N2=U7-PFT
N3=U7-100PAS-T2

# if temp files found, delete em
rm $OUTPUT
rm $INPUT





### display main menu ###
dialog --clear --title "[ M A I N - M E N U ]" \
--menu "Use 1-9 choose test item \nBuild by EFCO SamLee REV:$REV" 20 50 8 \
1 "$N1" \
2 "$N2" \
3 "$N3" \
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
		echo "cd $TEST_LOC; sudo sh $N1" > $TEST_LOC/t.sh
		sudo sh $TEST_LOC/t.sh
		exit 0
		;;
	2) 
		echo "2"
		clear
		echo "cd $TEST_LOC; sudo sh $N2" > $TEST_LOC/t.sh
		sudo sh $TEST_LOC/t.sh
		exit 2
		;;
	3) 
		echo "3"
		clear
		echo "cd $TEST_LOC; sudo sh $N3" > $TEST_LOC/t.sh
		sudo sh $TEST_LOC/t.sh
		exit 3
		;;
	c)	
		clear
		echo "c"
		sudo timedatectl set-ntp yes
		sudo timedatectl 
		sudo rclone copy /home/production/u7_log onedrive:General/u7_log -P
		sleep 5
		#sudo sh /home/production/hw_test/x.sh
		sudo sh /home/production/hw_test/t.sh
		exit 0
		;;
	u)	
		clear
		echo "u"
		cd /home/production/hw_test/
		#sudo sh git_reset.sh
		git pull
		sleep 5
		#sudo sh /home/production/hw_test/x.sh
		sudo sh /home/production/hw_test/t.sh
		exit 0		
		;;	

esac



