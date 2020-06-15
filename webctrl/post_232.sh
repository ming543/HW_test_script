#!/bin/bash
curl -X POST --data '{"baudrate":"0"}' http://$1/__/config/port/RS/1 | jq
