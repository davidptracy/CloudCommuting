/*
Example Sketch by Dimitris Papanikolaou
Opens a local CSV file with trip data from NYC CitiBike
Then plots the data

CSV Format:
Headers:
"tripduration","starttime","stoptime","start station id","start station name","start station latitude","start station longitude","end station id","end station name","end station latitude","end station longitude","bikeid","usertype","birth year","gender"
Example:
"634","2013-07-01 00:00:00","2013-07-01 00:10:34","164","E 47 St & 2 Ave","40.75323098","-73.97032517","504","1 Ave & E 15 St","40.73221853","-73.98165557","16950","Customer",\N,"0"
*/


String tripsFile = "2013-07-Citi_Bike_trip_data.csv";
Date timestamp;
SimpleDateFormat myDateParser = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Trip[] trips;

void setup(){
  background(255);
  //size(1000,750);
String[] myLines = loadStrings(tripsFile);
  myLines = subset(myLines, 1); //truncate the header
  trips = new Trip[myLines.length];
  for (int i = 0; i < myLines.length; i++) { 
    String[] data = split(myLines[i], ",");
   trips[i] = new Trip(data);
}
println("created " + trips.length + " trips in the database");
plot();
}


void draw(){
}


void plot(){
}



