#!/bin/sh

# cd ~/Data/Skripte/xplanet/

#wget http://home.megapass.co.kr/~gitto88/cloud_data/clouds_4096.jpg
#wget http://xplanetclouds.com/free/coral/clouds_2048.jpg
#wget http://xplanetclouds.com/free/local/clouds_2048.jpg
#wget ftp://ftp.iastate.edu/pub/xplanet/clouds_4096.jpg
#mv clouds_2048.jpg earth_clouds.jpg

xplanet --target earth --config my.conf --latitude 50 --longitude 10 --num_times 1 --output /home/flo/Wallpaper/xplanet.jpg --radius 180 --geometry 5760x1200
xfdesktop -reload
