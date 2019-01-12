#!/bin/bash
# Script for siteid function test by EFCO Sam

#For Debug
#set -xv

#---Start Function---
. ./lib/loc_var.lib

#request sn of UUT
. ./lib/sn_get.lib

#sn check
. ./lib/siteid_sn_test.lib

#Temp check set low and high range ex. 18 26
. ./lib/siteid_temp_test.lib 18 26

#door check
. ./lib/siteid_door_test.lib

#memory check
. ./lib/siteid_memory_test.lib
  
#Show ALL TEST PASS to log
. ./lib/pass_green.lib
