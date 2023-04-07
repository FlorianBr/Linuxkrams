#!/bin/bash

# Grabs the weather data from openweathermap and publishes it as JSON to MQTT

# Currently uses the old 2.5 API, not sure for how long that will work

CMD=mosquitto_pub
PARAMS='-h localhost'
TOPIC='world/wetter'

LAT='53.550341'
LON='10.000654'
APIKEY='SORRY,_SUPER_SECRET!'

MSG=`curl -s "https://api.openweathermap.org/data/2.5/weather?lat=${LAT}&lon=${LON}&appid=${APIKEY}&units=metric"`

$CMD $PARAMS -t ${TOPIC} -m "${MSG}"
