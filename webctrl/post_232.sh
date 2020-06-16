#!/bin/bash
curl -X POST --data '{"baudrate":"0"}' http://192.168.0.12/__/config/port/RS/1 | jq
