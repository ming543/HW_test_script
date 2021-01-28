#!/bin/bash
N3="hw_test"

result_check(){
	if [ $? = 0 ];then
		echo "****** Run passed! ******"
		sleep 1
	else
		echo "****** Run Failed! ******"
		sleep 5
	fi
}

sudo rclone copy -L /home/production/$N3 EFCO_test_script:/$N3 -P
result_check
