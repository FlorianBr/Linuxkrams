
# Stuff for my hyprland environment

I recently moved from KDE to the tiling WM hyprland. With fancy stuff like animated background and so on. NOT in a fingers-always-in-the-keyboard configuration, I usually use a macropad to control the workspaces, windows and so on.

TODO:

- Tweaking waybar
- Monitor off in swaylock
- colors and font in kitty
- Remove rofi with TBD?
- Customize wlogout
- Better system monitor in waybar?

## Swaylock

The lock screen I currently use. Maybe one day replaced by hyprlock?

## hypr

All the config stuff for hyprland. Still a heavy work in progress always tweaking the settings here and there

## kitty

The terminal used in hyprland. Not sure yet if I will stick to it or try something else

## mako

The notification manager. Nothing fancy here

## rofi

rofi applauncher. At the moment only used for the clipboard history

## walker

The applauncher I currently used instead of rofi

## waybar

The bar to display all sorts of data, current workspace, window title and so on

## wlogout

The logout screen. Not really customized yet

# Conky

My conky scripts. On all of my machines I use six panels on the bottom left of my monitor to display data:

 1. Generic info, system and GPU RAM
 2. Partition usage and root IO graph
 3. CPU overall and core graphs
 4. Fan speeds and temperatures
 5. Network infos
 6. Processes

# Docker

Docker compose files and other stuff I uso (or used) for docker containers:

- Grafana stack with influxdb, grafana, telegraf and chronograf
- Mosquitto MQTT broker
- PiHole for fighting spam and ads
- zigbee2mqtt for my zigbee network
- Home Assistant with Piper, Whisper and OpenWakeWord for assist (locally running voice assistant)

# KODI

Stuff for my Raspberry Pi running KODI. Probably deprecated because I haven't used it in a while, I mostly use a Nvidia Shield now.

# MQTT

Scripts to grab data from different sources and publish it on my local MQTT broker. Mostly for creating fancy graphs with Grafana or for home automation stuff.

Currently with scripts for:

- Diesel price
- ETF prices
- Local ethernet traffic
- Fritzbox WAN traffic
- Current water level
- Current weather
- PiHoles statistics

# Munin

Scripts for Munin. Probably deprecated, I havent used munin in a while

# RRD

Scripts for RRD-Tool. To generate databases and dump RRS-Data into a influxdb

# Squid

Scripts for Squid proxy to filter spam and update filter lists. Probably deprecated, I replaced squid with PiHole

# Tracker

Old scripts for tracking my phone. Very hacky, no real security whatsoever. I replaced it long ago with nextclouds phonetrack

# XPlanet

Scripts and config to render xplanet on the desktop background with current light and cloud maps

# ZSH

My zsh settings. Incomplete and WIP
