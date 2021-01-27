#!/bin/bash
N1="tools"
N2="screening_test"

result_check(){
	if [ $? = 0 ];then
		echo "****** Run passed! ******"
		sleep 1
	else
		echo "****** Run Failed! ******"
		echo "****** Run Failed! ******"
		echo "****** Run Failed! ******"
		echo "****** Run Failed! ******"
		echo "****** Run Failed! ******"
		echo "****** Run Failed! ******"
		sleep 5
	fi
}

sudo rclone copy EFCO_test_script:/$N1 /home/production/$N1 -P
result_check
sudo rclone copy EFCO_test_script:/$N2 /home/production/$N2 -P
result_check
