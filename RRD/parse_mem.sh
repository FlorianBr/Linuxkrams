#!/bin/bash

# Dump mem info, load and temperatures into RRDs

# Memory Info
TOTAL=`cat /proc/meminfo | grep MemTotal | sed -ne 's/.*  //gp' | sed -ne 's/ .*//gp'`
FREE=`cat /proc/meminfo | grep MemFree | sed -ne 's/.*  //gp' | sed -ne 's/ .*//gp'`
AVAIL=`cat /proc/meminfo | grep MemAvail | sed -ne 's/.*  //gp' | sed -ne 's/ .*//gp'`
rrdtool update /root/rrdtool/rrds/mem.rrd N:$TOTAL:$FREE:$AVAIL

# System Load
LOAD=`cat /proc/loadavg | sed -ne 's/ .*//gp'`
rrdtool update /root/rrdtool/rrds/load.rrd N:$LOAD

# CPU Temperature
TEMP=`sensors -j | jq '."cpu_thermal-virtual-0"."temp1"."temp1_input"'`
rrdtool update /root/rrdtool/rrds/cputemp.rrd N:$TEMP


