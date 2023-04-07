#!/bin/bash

# Grabs data from AVMs FritzBox and publishes it as JSON to MQTT

# AVMs Documentation:
# https://avm.de/fileadmin/user_upload/Global/Service/Schnittstellen/wancommonifconfigSCPD.pdf

IP=192.168.178.1
CMD=mosquitto_pub
PARAMS='-h localhost'
TOPIC='world/fritzbox'

RQ='<?xml version="1.0" encoding="utf-8" ?>
    <s:Envelope s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:s="http://schemas.xmlsoap.org/soap/envelope/">
        <s:Body>
            <u:GetCommonLinkProperties xmlns:u="urn:schemas-upnp-org:service:WANCommonInterfaceConfig:1" />
        </s:Body>
    </s:Envelope>'

RS=`curl -s "http://${IP}:49000/igdupnp/control/WANCommonIFC1" -H "Content-Type: text/xml; charset="utf-8"" -H "SoapAction:urn:schemas-upnp-org:service:WANCommonInterfaceConfig:1#GetCommonLinkProperties" -d "${RQ}"`
TXMAX=`echo ${RS} | sed -ne 's/.*<NewLayer1UpstreamMaxBitRate>//gp' | sed -ne 's/<.*//gp'`
RXMAX=`echo ${RS} | sed -ne 's/.*<NewLayer1DownstreamMaxBitRate>//gp' | sed -ne 's/<.*//gp'`

RS=`curl -s "http://${IP}:49000/igdupnp/control/WANCommonIFC1" -H "Content-Type: text/xml; charset="utf-8"" -H "SoapAction:urn:schemas-upnp-org:service:WANCommonInterfaceConfig:1#GetAddonInfos" -d "${RQ}"`
TX=`echo ${RS} | sed -ne 's/.*<NewTotalBytesSent>//gp' | sed -ne 's/<.*//gp'`
RX=`echo ${RS} | sed -ne 's/.*<NewTotalBytesReceived>//gp' | sed -ne 's/<.*//gp'`

MSG="{ \"RX\": ${RX}, \"TX\": ${TX}, \"RXMAX\": ${RXMAX}, \"TXMAX\": ${TXMAX} }"

$CMD $PARAMS -t ${TOPIC} -m "${MSG}"
