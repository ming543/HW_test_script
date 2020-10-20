#!/bin/bash
DUT=192.168.3.170

#Set RS232-1 baud to 115200
curl -X POST --data '{"baudrate":"0"}' http://$DUT/__/config/port/RS232/1 | jq
#Set RS232-2 baud to 115200
curl -X POST --data '{"baudrate":"0"}' http://$DUT/__/config/port/RS232/2 | jq
#Set RS485 baud to 9600
curl -X POST --data '{"baudrate":"5"}' http://$DUT/__/config/port/RS485/1 | jq
#Set DI1 to NTC
curl -X POST --data '{"type":"9"}' http://$DUT/__/config/input/IN/1 | jq
#Set DI2 to Switch to GND
curl -X POST --data '{"type":"10"}' http://$DUT/__/config/input/IN/2 | jq
#Set DI3 to counter
curl -X POST --data '{"type":"3"}' http://$DUT/__/config/input/IN/3 | jq
