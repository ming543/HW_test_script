#!/bin/bash
#log_folder=/home/production/u7_log/
log_folder=/home/production/log/

#find $log_folder -name "*PASS.log" -exec cp {} PASS \;
find $log_folder -name "*T2*PASS.log" -exec grep -wH "003 X 2" {} \;
find $log_folder -name "*T2*PASS.log" -exec grep -wH "003 X 2" {} \; | wc -l
