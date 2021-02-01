#!/bin/bash
# utilitymenu.sh - A sample shell script to display menus on screen
# Store menu options selected by the user
#set -xv
INPUT=/tmp/menu
OUTPUT=/tmp/output
REV=$(cat /home/production/hw_test/revision | head -1 | awk '{print $1}')
TEST_LOC=/home/production/hw_test

# if temp files found, delete em
#rm $OUTPUT
#rm $INPUT


### display main menu ###<high><width><menu_hight>
dialog --clear --title "[ M A I N - M E N U ]" \
--menu "Use 1-9 choose test item \nBuild by EFCO SamLee REV:$REV" 30 50 15 \
m "AIM SYSTEM Test" \
h "AIH SYSTEM Test" \
7 "U7XX SYSTEM Test" \
8 "OTHER SYSTEM Test" \
q "Q7XX PCBA Test" \
3 "V3C/Accessory PCBA Test" \
2 "V2C/Accessory PCBA Test" \
b "Burn-In Test" \
o "OS CLONE" \
c "Copy Log to Onedrive" \
u "Update Linux Test Script" \
d "Update DOS Test Script" \
p "Power off Tester" \
2>$INPUT

menuitem=$(cat $INPUT)
#response=$?
# make decsion 

case $(cat $INPUT) in
	m)
		echo "m"
		clear
		echo "cd $TEST_LOC; sudo sh run_aim" > $TEST_LOC/t.sh
		sudo sh $TEST_LOC/t.sh
		exit m
		;;
	h)
		echo "h"
		clear
		echo "cd $TEST_LOC; sudo sh run_aih" > $TEST_LOC/t.sh
		sudo sh $TEST_LOC/t.sh
		exit h
		;;
	7)
		echo "7"
		clear
		echo "cd $TEST_LOC; sudo sh run_u7" > $TEST_LOC/t.sh
		sudo sh $TEST_LOC/t.sh
		exit 7
		;;
	8)
		echo "8"
		clear
		echo "cd $TEST_LOC; sudo sh run_other" > $TEST_LOC/t.sh
		sudo sh $TEST_LOC/t.sh
		exit 8
		;;
	q)
		echo "q"
		clear
		echo "cd $TEST_LOC; sudo sh run_q7" > $TEST_LOC/t.sh
		sudo sh $TEST_LOC/t.sh
		exit q
		;;
	3) 
		echo "v"
		clear
		echo "cd $TEST_LOC; sudo sh run_v3c" > $TEST_LOC/t.sh
		sudo sh $TEST_LOC/t.sh
		exit 3
		;;
	2) 
		clear
		echo "cd $TEST_LOC; sudo sh run_v2c" > $TEST_LOC/t.sh
		sudo sh $TEST_LOC/t.sh
		exit 2
		;;
	b) 
		echo "b"
		clear
		echo "cd $TEST_LOC; sudo sh run_bi" > $TEST_LOC/t.sh
		sudo sh $TEST_LOC/t.sh
		exit 0 
		;;
	o) 
		echo "0"
		clear
		echo "cd $TEST_LOC; sudo sh run_os" > $TEST_LOC/t.sh
		sudo sh $TEST_LOC/t.sh
		exit 3
		;;
	c)	
		clear
		rm $INPUT
		sudo timedatectl set-ntp yes
		sudo timedatectl 
        	sudo timedatectl set-local-rtc 1
		sleep 2
		sudo rclone copy /home/production/u7_log onedrive:General/u7_log -P
		if [ $? = 0 ];then echo "****** Run passed! ******"; else echo "****** Run failed! ******"; fi 
		sleep 3
		sudo rclone copy /home/production/EagleEyes_LOG onedrive:General/EagleEyes_LOG -P
		if [ $? = 0 ];then echo "****** Run passed! ******"; else echo "****** Run failed! ******"; fi 
		sleep 3
		#sudo rsync -avh /home/production/EagleEyes_LOG /media/production/USB30/EagleEyes_LOG
		#sudo rsync -avh /home/production/u7_log /media/production/USB30/u7_log
		sleep 2
		sudo sh $TEST_LOC/run_main.sh
		exit 0
		;;
	u)	
		clear
		rm $INPUT
		echo "u"
		cd /home/production/hw_test/
		sudo sh git_reset.sh
		sleep 3
		sudo rclone -v copy onedrive:/General/rclone/rclone.conf /tmp/rclone.conf -P
		sudo cp /tmp/rclone.conf /root/.config/rclone/rclone.conf
		sudo rclone -v copy -L --ignore-size EFCO_test_script:/hw_test /home/production/hw_test -P
		if [ $? = 0 ];then echo "****** Run passed! ******"; else echo "****** Run failed! ******"; fi 
		sleep 3
		sudo sh $TEST_LOC/run_main.sh
		exit 0		
		;;	
	d)	
		clear
		rm $INPUT
		sudo rclone -v copy onedrive:/General/rclone/rclone.conf /tmp/rclone.conf -P
		sudo cp /tmp/rclone.conf /root/.config/rclone/rclone.conf
		sudo rclone copy EFCO_test_script:/V23C_DOS /home/production/V23C_DOS -P
		if [ $? = 0 ];then echo "****** Run passed! ******"; else echo "****** Run failed! ******"; fi 
		sleep 3
		sudo sh $TEST_LOC/run_main.sh
		exit 0		
		;;	
	p)
		echo "p"
		rm $INPUT
		sudo poweroff
		exit 0
		;;
	*) 
		echo "0"
		clear
		echo "cd $TEST_LOC; sudo sh run_main.sh" > $TEST_LOC/t.sh
		sudo sh $TEST_LOC/t.sh
		exit 3
		;;	
esac



