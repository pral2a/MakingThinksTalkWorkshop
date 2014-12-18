import processing.serial.*;

// Create object from Serial class for communicating with the Arduino
Serial myPort;  

XML xml;

int stationA_ID = 56; // Plaça ELISAVA
int stationB_ID = 378;   // DRASSANES

int stationA_bikes = 0; // Plaça ELISAVA
int stationB_bikes = 0;   // DRASSANES

void setup() {
  selectSerialPort();
}


void draw() {
  xml = loadXML("http://wservice.viabicing.cat/v1/getstations.php?v=1");
  XML[] bicingStations = xml.getChildren("station");

  //println(bicingStations);

  for (int i = 0; i < bicingStations.length; i++) {
    XML station_id = bicingStations[i].getChild("id");
    int id = int(station_id.getContent());
    XML station_bikes = bicingStations[i].getChild("bikes");
    int bikes = int(station_bikes.getContent());

    if (id == stationA_ID) {
      stationA_bikes = bikes;
    }

    if (id == stationB_ID) {
      stationB_bikes = bikes;
    }
  }

  println("Plaça ELISAVA: " + stationA_bikes + " Plaça Drassanes: " + stationB_bikes);

  if (stationA_bikes > stationB_bikes) {
    println("Go LEFT");
    myPort.write('L');
  } 
  else {
    println("Go RIGHT");
    myPort.write('R');
  }

  delay(2*1000);
}

