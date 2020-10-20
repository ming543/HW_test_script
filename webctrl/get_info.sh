#!/bin/bash
DUT=192.168.3.170

curl -X GET http://$DUT/__/system/info | jq
