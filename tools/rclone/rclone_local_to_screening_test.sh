#!/bin/bash
N2="screening_test"

result_check(){
	if [ $? = 0 ];then
		echo "****** Run passed! ******"
		sleep 1
	else
		echo "****** Run Failed! ******"
		sleep 5
	fi
}

sudo rclone copy /home/production/$N2 EFCO_test_script:/$N2 -P
result_check
