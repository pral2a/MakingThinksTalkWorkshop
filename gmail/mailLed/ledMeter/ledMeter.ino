#include "LPD8806.h"
#include "SPI.h" // Comment out this line if using Trinket or Gemma

// Number of RGB LEDs in strand:
int nLEDs = 18;

// Chose 2 pins for output; can be any valid output pins:
int dataPin  = 2;
int clockPin = 3;

// First parameter is the number of LEDs in the strand.  The LED strips
// are 32 LEDs per meter but you can extend or cut the strip.  Next two
// parameters are SPI data and clock pins:
LPD8806 strip = LPD8806(nLEDs, dataPin, clockPin);


int emailsToRead = 0;


void setup() {
  //Serial begin
  Serial.begin(9600);
  
  // Start up the LED strip
  strip.begin();

  // Update the strip, to start they are all 'off'
  strip.show();  
  //rainbow(6);
}


void loop() {
  receiveEmailsToRead();
  updateLEDs();
}

void updateLEDs() {
  for (int i=0; i < strip.numPixels(); i++) {
    if (i < emailsToRead){
      strip.setPixelColor(i, strip.Color(255,0,0));
    } 
    else {
      strip.setPixelColor(i, strip.Color(0,0,255));
    }
    //delay(50);
    strip.show();
  }
}


void receiveEmailsToRead() {
  if (Serial.available()) {
    // read the oldest byte in the serial buffer:
    byte incomingByte = Serial.read();
    emailsToRead = int(incomingByte);
  }
}





