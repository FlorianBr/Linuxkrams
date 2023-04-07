#!/bin/bash

# Grabs the RX and TX data of eth0 and publishes it as JSON to MQTT

# My telegraph/grafana installation is running in docker containers and
# has no access to the real interface.

CMD=mosquitto_pub
PARAMS='-h localhost'
TOPIC='world/eth0'

RX=`/sbin/ifconfig eth0 | grep RX | grep bytes | sed -ne 's/.*bytes //gp' | sed -ne 's/ (.*//gp'`
TX=`/sbin/ifconfig eth0 | grep TX | grep bytes | sed -ne 's/.*bytes //gp' | sed -ne 's/ (.*//gp'`

MSG="{ \"RX\": ${RX}, \"TX\": ${TX} }"

$CMD $PARAMS -t ${TOPIC} -m "${MSG}"
