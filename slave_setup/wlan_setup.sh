#!/bin/bash
WLAN=wlp2s0b1
CONF=/run/initramfs/memory/data/server/wpa_supplicant.conf
wpa_supplicant -B -i $WLAN -c $CONF
dhclient $WLAN
