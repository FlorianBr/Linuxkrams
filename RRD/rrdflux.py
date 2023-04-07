#!/usr/bin/python
# -*- coding: utf-8 -*-

# Dumps data from a RRD to infuxdb
#
# This script is intended to take data from a RRD file and put it in a
# database now feeded with measurements from telegraphs MQTT input.
#
# based on https://github.com/Joan10/rrdflux

import sys,getopt
import rrdtool
import pprint
from influxdb import InfluxDBClient
import datetime

def main(argv):

   # DB Settings. You need to adjust these
   host="localhost"           # Server
   port="8086"                # Port
   db="telegraf"              # Database name
   user="admin"               # User
   password="SuperSecret"     # password

   # fixed settings
   tag="topic"                # Tag used by the mqtt input plugin
   device="mqtt_consumer"     # Device / measurement

   # Overwritten by command line
   topic=""
   fname=""
   key=""

   def help():
      print('Usage: rddflux.py -f <RRD FILE> [-h] ')
      print('Dumps passed RRD File to InfluxDB database')
      print('   -h, --help      Display help and exit')
      print('   -f, --file      RRD file to dump')
      print('   -k, --key       The key')
      print('   -t, --topic     The Topic to use')

   try:
      opts, args = getopt.getopt(argv,"hf:k:t:",["help=","file=","key=","topic="])
   except getopt.GetoptError:
      help()
      sys.exit(2)

   for opt, arg in opts:
      if opt == '-h':
         help()
         sys.exit()
      elif opt in ("-f", "--file"):
         fname = arg
      elif opt in ("-k", "--key"):
         key = arg
      elif opt in ("-t", "--topic"):
         topic = arg

   if fname == "" or key == "" or topic == "":
      print("ERROR: Missing parameter(s)!")
      help()
      sys.exit(2)

   client = InfluxDBClient(host, port, user, password, db)
   client.query("create database "+db+";") # Create database if it not exists

   allvalues = rrdtool.fetch(
      fname,
      "LAST",
      '-s 946681200',      # Start 1.1.2000
      '-e now',            # End is now
      )
   i=0

   # Read RRDs step size to calculate correct timestamps
   STEPSIZE = allvalues[0][2]

   while i < len(allvalues[2]):
      val=allvalues[2][i][0]
      unixts=allvalues[0][0]+(i+1)*STEPSIZE

      # My influxdb seems to be unable to handle unix timestamps?!
      timestr=datetime.datetime.fromtimestamp(unixts).strftime('%Y-%m-%d %H:%M:%S')

      json_body = [
         {
            "measurement": device,
            "tags": { tag: topic },
            "time": timestr,
            "fields": {
               key: val,
            }
         }
      ]

      # Skip entries without value
      if val != None:
         print(json_body)
         client.write_points(json_body)

      i=i+1

if __name__ == "__main__":
   main(sys.argv[1:])


