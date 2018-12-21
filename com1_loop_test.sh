#!/bin/bash
# REVISON:R3 
# Script for gamming system function test by EFCO Sam

TEMP_LOG=/run/initramfs/memory/data/HW_test_script/tmp/com1.tmp
COM=/dev/ttyUSB0

COM_LOOP(){
	rm -r $TEMP_LOG
	stty -F $COM 115200 raw -echo #config serial port
	exec 3<$COM #redirect serial output to FD 3
	cat <&3 > $TEMP_LOG & #redirect serial output to file
	PID=$! #save PID to kill cat
	echo "5555AAAA" > $COM # send command to serial port
	sleep 0.2s # wait for response
	kill $PID # kill cat process
	exec 3<&- #free FD 3
	#cat $TEMP_LOG
}

for (( c=0; c<=10; c++))
do
	COM_LOOP
	LCHK=$(grep "5555AAAA" "$TEMP_LOG" )
	if [ $LCHK == "5555AAAA" ]
		then
		echo "****** The RS232 port $COM test passed! ******" | tee -a $TEMP_LOG
		echo " " | tee -a $TEMP_LOG
	else
		clear
		sh fail_red.sh
		echo "****** RS232 looptest fail $LCHK, please check! ******" | tee -a $TEMP_LOG
		read -p "Press any key to stop test." key
		kill -9 $? 
		#pkill -f start.sh

	fi
done









