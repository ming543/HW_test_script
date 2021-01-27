#!/bin/bash
N1="tools"
N2="screening_test"
N3="hw_test"
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

sudo rclone copy /home/production/$N1 EFCO_test_script:/$N1 -P
result_check
sudo rclone copy /home/production/$N2 EFCO_test_script:/$N2 -P
result_check
sudo rclone copy -L /home/production/$N3 EFCO_test_script:/$N3 -P
result_check
sudo rclone copy -L /home/production/$N4 EFCO_test_script:/$N4 -P
result_check
