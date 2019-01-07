#!/bin/bash
#sort the logfiles data into sqlite db
#set -xv

SQLITE_DB=/run/initramfs/memory/data/HW_test_script/master_setup/logfiles.db
TBL_1=log_5025
LOG=/run/initramfs/memory/data/logfiles/5555-20190103161859.log

sqlite $SQLITE_DB<<END_SQL
.headers on
.mode column
insert into $TBL_1 values (1,2,3,4,5,6,7,8,9,0);
select * from $TBL_1;
.quit
END_SQL



#sqlite $SQLITE_DB "create table $TBL_1(MODEL, SN, CPU, MEMORY, DISK_SIZE, DISK_SPEED, RS232_1, RS232_2, RS232_3, VGA, RESULT);"
#sqlite $SQLITE_DB "insert into $TBL_1 values (MODEL, SN, CPU, MEMORY, DISK_SIZE, DISK_SPEED, RS232_1, RS232_2, RS232_3, VGA, RESULT);"
#sqlite $SQLITE_DB "select * from $TBL_1;"



