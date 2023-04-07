#!/bin/bash

# Grabs the current price for diesel from the gas station around the corner
# and publishes it as JSON to MQTT

# TODO Change to a open-data API

CMD=mosquitto_pub
PARAMS='-h localhost'
TOPIC='world/diesel'

DIESEL=`curl -s https://www.clever-tanken.de/tankstelle_details/9156 | grep '"current-price-1"' | sed -ne 's/.*">//gp' | sed -ne 's/<.*//gp'`

MSG="{ \"DIESEL\": ${DIESEL} }"

$CMD $PARAMS -t ${TOPIC} -m "${MSG}"
