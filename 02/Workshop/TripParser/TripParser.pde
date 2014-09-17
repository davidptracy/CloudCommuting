String tripsFile = "CSV_FILENAME.csv";
SimpleDatFormat myDateParser = new SimpleDateFormat("yyy-MM-dd HH:mm:ss:");
Trip[] trips;

void setup() {
  background(255);
  
  String[] myLines = loadStrings(tripsFile);
  myLines = subset(myLines, 1);
  trips = new Trip[myLines.length];
  
  for (int i=0; i< myTrips.length; i++) {
    String[] data = split(myLines[i], ",");
    trip[i] = new Trip(data);
  }
}

class Trip {

  int tripDuration;
  Date startTime, endTime;
  String startStationId, endStationId, bikeId;
  String startStationName, endStationName;
  float statStationLat, startStationLong, endStationLat, endStationLong;
  String userType, birthYear, gender;

  SimpleDateFormat myDateParser = new SimpleDateFormat("yyy-MM-dd HH:mm:ss");

  //Constructor
  Trip(String[] data) {
    for (int i=0; i<data.length; i++) {
      data[i] = data[i].replace("\"", "");
    }
    try {
      tripDuration = parseInt(data[0]);
      startTime = myDateParser.parse(data[1]);
      stopTime = myDateParser.parse(data[2]);

      startStationId = data[3];
      //and so on ...
    }
  }
}

class Station {
  int inventory;
  String id;
  String name;
  float lat;
  float lng;
}

