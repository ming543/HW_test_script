#!/bin/bash
N4="V23C_DOS"

result_check(){
	if [ $? = 0 ];then
		echo "****** Run passed! ******"
		sleep 1
	else
		echo "****** Run Failed! ******"
		sleep 5
	fi
}

sudo rclone -v copy -L /home/production/$N4 EFCO_test_script:/$N4 -P
result_check
