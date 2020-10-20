#!/bin/bash
DUT=192.168.3.170
I=0
while [ $I -lt 5 ]
do
	I=$(($I+1))
	curl -X POST --data '{"OD/3":"1"}' http://$DUT/__/io/channel/OD
	sleep 1
	curl -X POST --data '{"OD/3":"0"}' http://$DUT/__/io/channel/OD
	sleep 1
done

