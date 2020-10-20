#!/bin/bash
DUT=192.168.3.170

curl -X GET http://$DUT/__/config/port/RS/1 | jq
#curl -X GET http://$DUT/__/bundle | jq
