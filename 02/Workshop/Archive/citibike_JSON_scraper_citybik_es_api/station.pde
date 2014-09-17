class Station {
String ID;
String name;
int bikes;
int free;
float lat;
float lng; 
float inventoryLevel; //percentile index of inventory saturation

//constructor
Station (String ID, String name, int bikes, int free, float lat, float lng){
this.ID=ID;
this.name=name;
this.bikes=bikes;
this.free=free;
this.lat=lat;
this.lng=lng;
inventoryLevel = float(bikes) / (bikes + free);
}
  

/*** methods ***/

float getLat(){
  return lat;
}

float getLng(){
  return lng;
}

int getBikes(){
  return bikes;
}

int getFree(){
  return free;
}

float getInventoryLevel(){
  return inventoryLevel;
}

}
