/*
"tripduration","starttime","stoptime","start station id","start station name","start station latitude","start station longitude","end station id","end station name","end station latitude","end station longitude","bikeid","usertype","birth year","gender"
*/

class Trip {
 int tripDuration;
 Date startTime, stopTime;
 String startStationId, endStationId, bikeId;
 String startStationName, endStationName;
 float startStationLat, startStationLng, endStationLat, endStationLng;
 String userType, birthYear, Gender;

 SimpleDateFormat myDateParser = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

   //CONSTRUCTOR
  Trip (String[] data) {
    for (int i = 0; i < data.length; i++) {
      data[i] = data[i].replace("\"", "");
    }
    try{
   tripDuration = parseInt(data[0]);
   startTime = myDateParser.parse(data[1]);
   stopTime = myDateParser.parse(data[2]);
   
   startStationId = data[3];
   startStationName = data[4];
   startStationLat = parseFloat(data[5]);
   startStationLng = parseFloat(data[6]);
   
   endStationId = data[7];
   endStationName = data[8];
   endStationLat = parseFloat(data[9]);
   endStationLng = parseFloat(data[10]);
   
   bikeId = data[11];
   
   userType = data[12];
   birthYear = data[13];
   Gender = data[14];
    } catch (Exception e) { println(e);}
  }
  
  
  //METHODS
  
  Date getStartTime(){
    return startTime;
  }
  Date getStopTime(){
    return stopTime;
  }
  
}
