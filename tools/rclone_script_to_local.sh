#!/bin/bash
#N1="V23C_DOS"
N1="hw_test"
#N1="tools"
#N1="screening_test"

result_check(){
	if [ $? = 0 ];then
		echo "****** Run passed! ******"
		sleep 1
	else
		echo "****** Run Failed! ******"
		echo "****** Run Failed! ******"
		echo "****** Run Failed! ******"
		sleep 5
	fi
}

sudo rclone -v sync EFCO_test_script:/$N1 /home/production/$N1 -P
result_check
