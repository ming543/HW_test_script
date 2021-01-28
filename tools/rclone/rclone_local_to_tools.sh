#!/bin/bash
N1="tools"

result_check(){
	if [ $? = 0 ];then
		echo "****** Run passed! ******"
		sleep 1
	else
		echo "****** Run Failed! ******"
		sleep 5
	fi
}

sudo rclone copy /home/production/$N1 EFCO_test_script:/$N1 -P
result_check
