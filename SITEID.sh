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

#Temp check

#door check

#memory check
  
#Show ALL TEST PASS to log
. ./lib/pass_green.lib
