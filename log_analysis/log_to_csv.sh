#!/bin/bash
#log_folder=/home/production/u7_log/
log_folder=/home/production/log/
big_log=/home/production/log/big_log.txt

#find $log_folder -name "*PASS.log" -exec cp {} PASS \;
find $log_folder -type f -name "*T2*PASS.log" -exec cat {} + >> $big_log
#output log file
echo "Model , SN , Start , OEM , RTC" >> csv_data.csv 
< $big_log awk '{print $1 " , "$2" ," $3}' >> csv_data.csv
