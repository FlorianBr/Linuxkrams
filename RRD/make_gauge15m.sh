#!/bin/bash

# Update: Every 15 Minutes
# Step:   900 secs (15 min)
# RRAs:   8640 with average 1 = 90d with 15min res
#         1068 with average 96 = 3y with 1d res

rrdtool create gauge15m.rrd \
	-s 900 \
	DS:preis:GAUGE:1800:U:U \
	RRA:MIN:0.5:1:8640 \
	RRA:AVERAGE:0.5:1:8640 \
	RRA:MAX:0.5:1:8640 \
	RRA:MIN:0.5:96:1068 \
	RRA:AVERAGE:0.5:96:1068 \
	RRA:MAX:0.5:696:1068
