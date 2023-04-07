#!/bin/bash

# Update: Every Minute
# Step:   60 secs
# RRAs:   1440 with average 1 = 24 hours with 1min res
#         672 with average 30 = 336h / 14d with 1/2h res
#         8760 with average 60 = 365d with 1h res

rrdtool create network.rrd \
	-s 60 \
	DS:RX:DERIVE:120:0:U \
	DS:TX:DERIVE:120:0:U \
	RRA:LAST:0.5:1:1440 \
	RRA:AVERAGE:0.5:1:1440 \
	RRA:MAX:0.5:1:1440 \
	RRA:LAST:0.5:30:672 \
	RRA:AVERAGE:0.5:30:672 \
	RRA:MAX:0.5:30:672 \
	RRA:LAST:0.5:60:4320 \
	RRA:AVERAGE:0.5:60:4320 \
	RRA:MAX:0.5:60:4320

