#!/bin/bash

# sleep 20s
killall conky
sleep 20

conky -c "/home/flo/.conky/conky_l1.conf" &
conky -c "/home/flo/.conky/conky_l2.conf" &
conky -c "/home/flo/.conky/conky_l3.conf" &
conky -c "/home/flo/.conky/conky_l4.conf" &
conky -c "/home/flo/.conky/conky_l5.conf" &
conky -c "/home/flo/.conky/conky_l6.conf" &
