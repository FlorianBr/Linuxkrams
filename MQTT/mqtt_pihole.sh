#!/bin/bash

# Grabs data from a PiHole and publishes it as JSON to MQTT

CMD=mosquitto_pub
PARAMS='-h localhost'
TOPIC='world/pihole'
PIHOLE='http://<address>:<port>'
APITOKEN='<API Key>'

MSG=`curl -s "${PIHOLE}/admin/api.php?summaryRaw&auth=${APITOKEN}"`

$CMD $PARAMS -t ${TOPIC} -m "${MSG}"

