// Platz für weitere Definitionen

"use strict";

window.JB = window.JB || {};
JB.Icons = function(baseurl) {
  this.DefShadow  = { shadow: { anchor: {x:10,y:35}, url: baseurl+"Icons/shadow50.png" } };
  this.Bild       = { icon:   { anchor: {x: 6,y:31}, url: baseurl+"Icons/scenic.png" },
                      shadow: { anchor: {x:10,y:31}, url: baseurl+"Icons/shadow.png" } };
  this.MoveMarker = { icon:   { anchor: {x: 6,y: 6}, url: baseurl+"Icons/marker.gif" } };
  this.Cluster    = { icon:   { anchor: {x:16,y:16}, url: baseurl+"Icons/cluster.png" } };
  this.lodging    = { icon:   { anchor: {x:15,y:36}, url: baseurl+"Icons/hotel2.png" },
	//this.lodging    = { icon:   { anchor: {x:15,y:31}, url: baseurl+"Icons/hotel.png" },
                      shadow: { anchor: {x:10,y:31}, url: baseurl+"Icons/shadow.png" } };
  this.museum     = { icon:   { anchor: {x:15,y:36}, url: baseurl+"Icons/museum.png" },
                      shadow: { anchor: {x:10,y:31}, url: baseurl+"Icons/shadow.png" } };
  this.residence  = { icon:   { anchor: {x:15,y:36}, url: baseurl+"Icons/villa.png" },
                      shadow: { anchor: {x:10,y:31}, url: baseurl+"Icons/shadow.png" } };
  this.library    = { icon:   { anchor: {x:15,y:36}, url: baseurl+"Icons/library.png" },
                      shadow: { anchor: {x:10,y:31}, url: baseurl+"Icons/shadow.png" } };
  this.park       = { icon:   { anchor: {x:15,y:36}, url: baseurl+"Icons/park.png" },
                      shadow: { anchor: {x:10,y:31}, url: baseurl+"Icons/shadow.png" } };
  this.castle     = { icon:   { anchor: {x:15,y:36}, url: baseurl+"Icons/castle.png" },
                      shadow: { anchor: {x:10,y:31}, url: baseurl+"Icons/shadow.png" } };
  this.airport    = { icon:   { anchor: {x:15,y:36}, url: baseurl+"Icons/airport.png" },
                      shadow: { anchor: {x:10,y:31}, url: baseurl+"Icons/shadow.png" } };
  this.church     = { icon:   { anchor: {x:15,y:36}, url: baseurl+"Icons/church2.png" },
                      shadow: { anchor: {x:10,y:31}, url: baseurl+"Icons/shadow.png" } };
  this.bridge     = { icon:   { anchor: {x:15,y:36}, url: baseurl+"Icons/bridge.png" },
                      shadow: { anchor: {x:10,y:31}, url: baseurl+"Icons/shadow.png" } };
  this.bar        = { icon:   { anchor: {x:15,y:36}, url: baseurl+"Icons/bar.png" },
                      shadow: { anchor: {x:10,y:31}, url: baseurl+"Icons/shadow.png" } };
  this.restaurant = { icon:   { anchor: {x:15,y:36}, url: baseurl+"Icons/restaurant.png" },
                      shadow: { anchor: {x:10,y:31}, url: baseurl+"Icons/shadow.png" } };
  this.start      = { icon:   { anchor: {x:15,y:36}, url: baseurl+"Icons/start.png" },
                      shadow: { anchor: {x:10,y:31}, url: baseurl+"Icons/shadow.png" } };
  this.finish     = { icon:   { anchor: {x:15,y:36}, url: baseurl+"Icons/finish.png" },
                      shadow: { anchor: {x:10,y:31}, url: baseurl+"Icons/shadow.png" } };
  this.flag       = { icon:   { anchor: {x:15,y:36}, url: baseurl+"Icons/flag.png" },
                      shadow: { anchor: {x:10,y:31}, url: baseurl+"Icons/shadow.png" } };
  this["shopping center"] = { icon:   { anchor: {x:15,y:36}, url: baseurl+"Icons/shoppingmall.png" },
                      shadow: { anchor: {x:10,y:31}, url: baseurl+"Icons/shadow.png" } };
  this["ground transportation"] = { icon:   { anchor: {x:15,y:36}, url: baseurl+"Icons/subway.png" },
                      shadow: { anchor: {x:10,y:31}, url: baseurl+"Icons/shadow.png" } };
  this["scenic area"] = { icon:   { anchor: {x:15,y:36}, url: baseurl+"Icons/photo.png" },
                      shadow: { anchor: {x:10,y:31}, url: baseurl+"Icons/shadow.png" } };
  this["boat ramp"]   = { icon:   { anchor: {x:15,y:36}, url: baseurl+"Icons/boat.png" },
                      shadow: { anchor: {x:10,y:31}, url: baseurl+"Icons/shadow.png" } };
  //this.myicon       = { icon:   { anchor: {x:15,y:36}, url: baseurl+"Icons/myicon.png" },
  //                    shadow: { anchor: {x:10,y:31}, url: baseurl+"Icons/shadow.png" } };
  // Most Icons from http://code.google.com/p/google-maps-icons/wiki/IconDescriptions
} ;   

JB.GPX2GM.units = {};
JB.GPX2GM.units.si =  {
	way: "km",
	speed: "km/h",
	alt: "m",
	pace: "min/km"
};
JB.GPX2GM.units.enus =  {
	way: "miles",
	speed: "mph",
	alt: "ft",
	pace: "min/mile"
};
JB.GPX2GM.units.airwater =  {
	way: "sm",
	speed: "kn",
	alt: "ft",
	pace: "min/sm"
};
JB.GPX2GM.strings = {};
JB.GPX2GM.strings.de = {
	lenght: "L\u00e4nge",
	way: "Strecke",
	//way_unit: "km",
	tstart: "Startzeit",
	time: "Zeit",
	time_unit: "Stunden",
	altdiff: "H\u00F6hendifferenz",
	alt: "H\u00F6he",
	//alt_unit: "m",
	grade: "Stg.",
	grade_unit: "%",
	avspeed: "V<sub>m</sub>",
	speed2: "Geschw.",
	speed: "V",
	//speed_unit: "km/h",
	pace: "Pace",
	//pace_unit: "min/km",
	hr2: "Puls",
	hr: "HF",
	hr_unit: "1/min",
	cad: "Cadenz",  
	cad_unit: "UpM",
	wpt: "Wegpunkt",
	wpts: "Wegpunkte",
	trk: "Track",
	trks: "Tracks",
	rte: "Route",
	rtes: "Routen",
	inmo: "in Bewegung"
}
JB.GPX2GM.strings.en = {
	lenght: "Length",
	way: "Way",
	//way_unit: "km",
	tstart: "Start time",
	time: "Time",
	time_unit: "hours",
	altdiff: "Elevation difference",
	alt: "Elevation", //"Altitude",
	//alt_unit: "m",
	grade: "Grade",
	grade_unit: "%",
	avspeed: "V<sub>m</sub>",
	speed2: "Speed",
	speed: "V",
	//speed_unit: "km/h",
	pace: "Pace",
	//pace_unit: "min/km",
	hr2: "Heart rate",
	hr: "HR",
	hr_unit: "1/min",
	cad: "Cadence", 
	cad_unit: "rpm",
	wpt: "Waypoint",
	wpts: "Waypoints",
	trk: "Track",
	trks: "Tracks",
	rte: "Route",
	rtes: "Routes",
	inmo: "in motion"
}

/* // Prototyp für Callbackfunktion
JB.GPX2GM.callback = function(pars) {
	JB.Debug_Info("callback",pars.id+" "+pars.type,false);
	switch(pars.type) {
		case "Map_div_v" :
			break;
		case "Map_div_n" :
			break;
		case "Map_v":
			break;
		case "Map_n":
			break;
		case "Wegpunkte_v":
			break;
		case "Wegpunkte_n":
			break;
		case "Routen_v":
			break;
		case "Routen_n":
			break;
		case "Tracks_v":
			break;
		case "Tracks_n":
			break;
		case "Profile_v":
			break;
		case "Profile_n":
			break;
		case "click_Marker_Text":
			break;
		case "click_Marker_Bild":
			break;
		case "click_Route":
			break;
		case "click_Track":
			break;
	}
	return true;
} // JB.GPX2GM.callback */

/*JB.Scaling = {   // nur paarweise verwenden
	hmin:0,hmax:1000,  // Höhenplot
	smin:-30,smax:30,  // Steigungsplot
	vmin:0,vmax:100,   // Geschwindigkeitsplot
	hrmin:50,hrmax:200,   // Herzfrequenz
	cadmin:0,cadmax:150,   // Trittfrequenz
	hardscaling:false   // Skalierwerte bindend (true) oder Minwerte(false)
}; */
