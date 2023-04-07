#!/bin/bash

# Grabs the current data of a few ETFs and publishes it as JSON to MQTT

CMD=mosquitto_pub
PARAMS='-h localhost'
TOPIC='world/etf'

# MSCI World ETF110
ETF1=`curl -s https://www.comdirect.de/inf/etfs/LU0392494562 | grep '"price"' | sed -ne 's/.*content="//gp' | sed -ne 's/".*//gp'`

# iShared Dev Markets AOLEW8
ETF2=`curl -s "https://www.comdirect.de/inf/etfs/detail/uebersicht.html?ID_NOTATION=162923181&ISIN=IE00B1FZS350" | grep '"price"' | sed -ne 's/.*content="//gp' | sed -ne 's/".*//gp'`

# MSCI Asia DBX1AE
ETF3=`curl -s https://www.comdirect.de/inf/etfs/LU0322252171 | grep '"price"' | sed -ne 's/.*content="//gp' | sed -ne 's/".*//gp'`

# MSCI ACWI A1JJTD
ETF4=`curl -s https://www.comdirect.de/inf/etfs/IE00B3YLTY66 | grep '"price"' | sed -ne 's/.*content="//gp' | sed -ne 's/".*//gp'`

MSG="{ \"ETF110\": ${ETF1}, \"A0LEW8\": ${ETF2}, \"DBX1AE\": ${ETF3}, \"A1JJTD\": ${ETF4} }"

$CMD $PARAMS -t ${TOPIC} -m "${MSG}"
