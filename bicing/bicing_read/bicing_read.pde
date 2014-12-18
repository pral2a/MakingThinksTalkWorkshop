XML xml;

void setup() {
  xml = loadXML("http://wservice.viabicing.cat/v1/getstations.php?v=1");
  XML[] bicingStations = xml.getChildren("station");

  //println(bicingStations);

  for (int i = 0; i < bicingStations.length; i++) {
    XML station_id = bicingStations[i].getChild("id");
    int id = int(station_id.getContent());

    XML station_slots = bicingStations[i].getChild("slots");
    int slots = int(station_slots.getContent());

    XML station_bikes = bicingStations[i].getChild("bikes");
    int bikes = int(station_bikes.getContent());
    
    int free = slots - bikes;

    println(" Station: " + id + " Bikes: " + bikes + " Free Slots: " + slots);
  }
}


