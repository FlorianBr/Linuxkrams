#!/bin/bash

# Grabs the current tide data from WSVs open data API and publishes it as JSON to MQTT

# WSVr documentation:
# https://www.pegelonline.wsv.de/webservice/ueberblick

CMD=mosquitto_pub
PARAMS='-h localhost'
TOPIC='world/pegel'
STATION="5952050"

MSG=`curl -s "https://www.pegelonline.wsv.de/webservices/rest-api/v2/stations/${STATION}.json?includeTimeseries=true&includeCurrentMeasurement=true"`

$CMD $PARAMS -t ${TOPIC} -m "${MSG}"
