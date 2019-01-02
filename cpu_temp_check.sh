# Script function for system CPU temp check by EFCO Sam
cpu_temp_check()
{
TEMP_LOG=/run/initramfs/memory/data/HW_test_script/tmp/temp.tmp
DMI_LOG=/run/initramfs/memory/data/HW_test_script/tmp/dmi.tmp
C=$1
#---get dmidecode info
rm -r $DMI_LOG
dmidecode > $DMI_LOG
#---Check CPU TEMP	
rm -r $TEMP_LOG
sensors -A | tee -a $TEMP_LOG 
TCHK=$(grep "Core 0" "$TEMP_LOG" | cut -c 16-17)
if [ $TCHK -gt $C ]
then
	clear
	sh fail_red.sh
	echo "****** CPU temp is $TCHK C the spec is $C C, test failed! ******" | tee -a $TEMP_LOG
	read -p "Press any key to stop test." key
	#kill -9 $? 
	#pkill -f start.sh
	return 1
else
	echo "****** The SPEC is $C, CPU temp is $TCHK test passed! ******" | tee -a $TEMP_LOG
	echo " " | tee -a $TEMP_LOG
	return 0
fi
}

