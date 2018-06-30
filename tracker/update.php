<?php

/*
Parameter	Bedeutung
user	Benutzername
pw	Passwort
lat	Breitengrad in Dezimalschreibweise
lon	Laengengrad id Dezimalschreibweise
alt	Hoehe in Metern
time	Zeitstempel (Sekunden seit dem 01.01.1970)
dir	Bewegungsrichtung in Grad
speed	Geschwindigkeit in m/s
*/

$con=mysql_connect('192.168.10.10', 'AndroidTracker', 'geheim') or die(mysql_error());
mysql_select_db("AndroidTracker",$con) or die(mysql_error());

$User=$_GET['user'];
$PW=$_GET['pw'];
$Lat=$_GET['lat'];
$Lon=$_GET['lon'];
$Alt=$_GET['alt'];
$time=$_GET['time'];
$Dir=$_GET['dir'];
$Speed=$_GET['speed'];

$sql="INSERT INTO Cell VALUES (NULL, NULL, '$User', '$PW',  '$Lat',  '$Lon',  '$Alt',  '$time',  '$Dir',  '$Speed' )";

$result=mysql_query($sql) or die(mysql_error());

mysql_close($con);

?>
