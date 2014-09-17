// This sketch visits a url with a JSON live feed, creates an array of JSON Objects, 
// and plots them in geographic coordinates. You will need to find a map and use it as a background image
// See more information on how to convert lat, long coordinates into x,y cartesian coordinates in this post: http://forum.processing.org/one/topic/using-a-world-map-in-processing.html
// Sketch example by Dimitris Papanikolaou, Sep 2014
// Modified by David Tracy with Voronoi Support, Sep 2014

/*
FORMAT of JSON FEED
 {
 "executionTime":"2014-09-08 01:23:02 PM",
 "stationBeanList":[
 {
 "id":72,
 "stationName":"W 52 St & 11 Ave",
 "availableDocks":35,
 "totalDocks":39,
 "latitude":40.76727216,
 "longitude":-73.99392888,
 "statusValue":"In Service",
 "statusKey":1,
 "availableBikes":4,
 "stAddress1":"W 52 St & 11 Ave",
 "stAddress2":"",
 "city":"",
 "postalCode":"",
 "location":"",
 "altitude":"",
 "testStation":false,
 "lastCommunicationTime":null,
 "landMark":"”
 },
 {
 "id":79,
 "stationName":"Franklin St & W Broadway”,
 …
 
 */


// IMPORT TOXICLIB MODULES

import toxi.processing.*;

import toxi.geom.*;
import toxi.geom.mesh2d.*;

import toxi.util.*;
import toxi.util.datatypes.*;

//helper class for rendering
ToxiclibsSupport gfx;

//declare a voronoi object of type Voronoi
Voronoi voronoi;

//declare map object
PShape map;

float mapGeoLeft   =  -74.14;          // Longitude 
float mapGeoRight  =  -73.86;          // Longitude
float mapGeoTop    =   40.80; //42.4085;          // Latitude 72 degrees north.
float mapGeoBottom =   40.66; //42.30651;          // Latitude 56 degrees south.

JSONArray stations;
String myURL;
JSONObject myJSONObject;

void setup() {
  size(800, 800);
  background(255);

  map = loadShape("NewYork-01.svg");

  //initialize the voronoi class
  voronoi = new Voronoi();

  gfx = new ToxiclibsSupport(this);

  myURL = "http://www.citibikenyc.com/stations/json";
  myJSONObject = loadJSONObject(myURL);
  stations = myJSONObject.getJSONArray("stationBeanList");

 
 // ITERATE THROUGH THE JSON 
  for (int i = 0; i < stations.size(); i++) {

    //Create a JSONObject from each JSON entry in the file
    JSONObject station = stations.getJSONObject(i); 

    // IGNORE ALL THE DATA WE DON'T CARE ABOUT
    //    int id = station.getInt("id");
    //    String stationName = station.getString("stationName");
    //    int availableDocks = station.getInt("availableDocks");
    //    int totalDocks = station.getInt("totalDocks");
    float latitude = station.getFloat("latitude");
    float longitude = station.getFloat("longitude");
    //    String statusValue = station.getString("statusValue");
    //    int statusKey = station.getInt("statusKey");
    //    int availableBikes = station.getInt("availableBikes");
    //    String stAddress1 = station.getString("stAddress1");
    //    String stAddress2 = station.getString("stAddress2");
    //    String city = station.getString("city");
    //    int postalCode = station.getInt("postalCode");

    PVector p = geoToPixel(new PVector(longitude, latitude));
    float xCor = p.x;
    float yCor = p.y;

    voronoi.addPoint(new Vec2D(xCor, yCor));
    //    float inv_level = (float)availableBikes/ (availableBikes + availableDocks);
    //    stroke(255, 0, 100, 100);
    noStroke();
    //    fill(255, 0, 100, inv_level * 255);
    ellipse(p.x, p.y, 20, 20);
    println(p.x+ ", " + p.y);
  }

  int i =0;
  for (Polygon2D poly : voronoi.getRegions()) { 
    JSONObject station = stations.getJSONObject(i);
    int availableDocks = station.getInt("availableDocks");
    colorMode(HSB, 100);    
    color c = color(94, map(availableDocks, 30, 0, 0, 100), 100);
    fill(c);
    gfx.polygon2D(poly);
    PVector p = geoToPixel(new PVector(longitude, latitude));
    fill(100,100,0);
    ellipse (p.x, p.y, 20, 20);
    i++;
  }

  shape(map, 0, 0);
}

//void draw() {
//  // draw all voronoi polygons, clip them if needed...
//  for (Polygon2D poly : voronoi.getRegions()) { 
//    gfx.polygon2D(poly);
//  }
//}

// Converts screen coordinates into geographical coordinates. 
// Useful for interpreting mouse position.
PVector pixelToGeo(PVector screenLocation)
{
  return new PVector(mapGeoLeft + (mapGeoRight-mapGeoLeft)*(screenLocation.x)/width, 
  mapGeoTop - (mapGeoTop-mapGeoBottom)*(screenLocation.y)/height);
}


// Converts geographical coordinates into screen coordinates.
// Useful for drawing geographically referenced items on screen.
public PVector geoToPixel(PVector geoLocation)
{
  return new PVector(width*(geoLocation.x-mapGeoLeft)/(mapGeoRight-mapGeoLeft), 
  height - height*(geoLocation.y-mapGeoBottom)/(mapGeoTop-mapGeoBottom));
}

