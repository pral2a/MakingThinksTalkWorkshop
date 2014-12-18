// Controlling a servo position using a potentiometer (variable resistor) 
// by Michal Rinott <http://people.interaction-ivrea.it/m.rinott> 

#include <Servo.h> 

Servo myservo;  // create servo object to control a servo 

int potpin = 0;  // analog pin used to connect the potentiometer
char val;    // variable to read the value from the analog pin 

void setup() 
{ 
  myservo.attach(9);  // attaches the servo on pin 9 to the servo object 
} 

void loop() 
{ 
  if (Serial.available()) { // If data is available to read,
    val = Serial.read(); // read it and store it in val
  }
  
  if (val == 'R') { // If H was received
    myservo.write(90);                  // sets the servo position according to the scaled value 
  } 
  else  if (val == 'L') {
    myservo.write(0);                  // sets the servo position according to the scaled value 
  }
  
  delay(15);                           // waits for the servo to get there 
} 





