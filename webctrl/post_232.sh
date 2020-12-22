#!/bin/bash
DUT=192.168.3.2

curl -X POST --data '{"baudrate":"5"}' http://$DUT/__/config/port/RS232/1 | jq

