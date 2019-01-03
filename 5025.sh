#!/bin/bash
# REVISON:R3 
# Script for gamming system function test by EFCO Sam

#For Debug
#set -xv

#---Start Function---
. ./lib/loc_var.lib

#request sn of UUT
. ./lib/sn_get.lib

#input spec of BI to script ex.disk/nodisk
. ./lib/bi_cli_auto.lib nodisk

#input spec of cpu temp to script ex.70
. ./lib/cpu_temp_check.lib 70

#input spec of memory (MByte) to script ex.8000
. ./lib/memory_check.lib 5833

#input spec of disk size and speed to script
. ./lib/disk_test.lib 110 200

#COM test
. ./lib/com1_loop_test.lib

#vga test
. ./lib/vga_test.lib
  
#Show ALL TEST PASS to log
. ./lib/pass_green.lib





