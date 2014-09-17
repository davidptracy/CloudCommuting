class Station {
  int inventory;
  String id;
  String name;
  float lat;
  float lng;
  float xCor;
  float yCor;

  //constructor
  Station (String id, String name, float lat, float lng) {
    this.id = id;
    this.name = name;
    this.lat = lat;
    this.lng = lng;
    inventory = 0;
  }


Station () {
    this.id = "undefined";
    this.name = "undefined";
    this.lat = 0.0;
    this.lng = 0.0;
    inventory = 0;
  }

  /*** methods ***/

  float getLat() {
    return lat;
  }

  float getLng() {
    return lng;
  }

}

