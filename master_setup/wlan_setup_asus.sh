#!/bin/bash
WLAN=wlx10c37bcdb314
CONF=/run/initramfs/memory/data/HW_test_script/master_setup/wpa_supplicant.conf
wpa_supplicant -B -i $WLAN -c $CONF
dhclient $WLAN
