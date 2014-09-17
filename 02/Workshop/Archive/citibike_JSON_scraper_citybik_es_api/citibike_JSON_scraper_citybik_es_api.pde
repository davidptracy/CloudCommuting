
// This code reads a JSON file and creates a databaase out of it
// Author: Dimitris Papanikolaou 2014


/* 
JSON basics:
JSONObject must begin with '{' and end with '}'
JSONArray must begin with '[' and end with ']'
JSON Object structure:
{
"id":"0", 
"name":"31000 - 20th & Bell St", 
"lat":"38856100", 
"lng":"-77051200", 
"timestamp":"2012-02-18 05:34:57.458568", 
"bikes":6, 
"free":5, 
"number":"31000", 
"internal_id":"1", 
"locked":"False", 
"temporary":"False", 
"installed":"True" 
}
*/


import org.json.*;  //library for parsing JSON files

JSONArray my_JSONdata;
Station[] myStations;
float maxLat, minLat, maxLng, minLng; //variable storing the geographical boundaries of the area
Station maxLatStation, minLatStation, maxLngStation, minLngStation;
String[] bikeSharingSystems;
int systemIndex=0;


void setup(){
String myURL = "http://api.citybik.es/citi-bike-nyc.json";
String myLines = join(loadStrings(myURL), "");

try{
my_JSONdata = new JSONArray(myLines);
myStations = new Station[my_JSONdata.length()];
  for (int i=0; i < my_JSONdata.length(); i++){
    
    String ID = my_JSONdata.getJSONObject(i).getString("id");
    String name = my_JSONdata.getJSONObject(i).getString("name");
    int bikes = Integer.parseInt(my_JSONdata.getJSONObject(i).getString("bikes"));
    int free = Integer.parseInt(my_JSONdata.getJSONObject(i).getString("free"));
    float lat = Float.parseFloat(my_JSONdata.getJSONObject(i).getString("lat"));
    float lng = Float.parseFloat(my_JSONdata.getJSONObject(i).getString("lng"));   
    myStations[i] = new Station(ID, name, bikes, free, lat, lng);     
    } 
  }  
  catch (JSONException e) {  
    println (e.toString());  
  }

println("Total number of stations: " + myStations.length);


for (int i=0; i<myStations.length; i++) {
  println(myStations[i].name);
  }
}








