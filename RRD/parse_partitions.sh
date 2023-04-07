#!/bin/bash

# Dump current partition data into a RRD

DATA=`df -k | grep sda1`
SIZE=`echo ${DATA} | awk '{print $2}'`
USED=`echo ${DATA} | awk '{print $3}'`
AVAIL=`echo ${DATA} | awk '{print $4}'`

rrdtool update /root/rrdtool/rrds/sda1.rrd N:$SIZE:$USED:$AVAIL
