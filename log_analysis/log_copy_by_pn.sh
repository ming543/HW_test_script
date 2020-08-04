#!/bin/bash
log_name="*T2*PASS.log"
#log_folder=/home/production/u7_log/
log_folder=/home/production/log
pn_folder=$log_folder/12345
mkdir $pn_folder
find $log_folder -name $log_name -exec cp {} $pn_folder \;
#find $log_folder -name "*T2*PASS.log" -exec grep -wH "003 X 2" {} \;
#find $log_folder -name "*T2*PASS.log" -exec grep -wH "003 X 2" {} \; | wc -l
