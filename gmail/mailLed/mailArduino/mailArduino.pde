/*
Making Thing Talk - Workshop Elisava - DEC 2014
 https://live.temboo.com/library/Library/Google/Gmail/
 */

import com.temboo.core.*;
import com.temboo.Library.Google.Gmail.*;
import processing.serial.*;

// Create object from Serial class for communicating with the Arduino
Serial myPort;  

// Create a session using your Temboo account application details
TembooSession session = new TembooSession("pral2a", "myFirstApp", "c7367f78-074d-4888-b");

// Create the Choreo object using your Temboo session
GetUnreadMail getUnreadMailChoreo = new GetUnreadMail(session);

void setup() {
  size(10, 10);
  getUnreadMailChoreo.setUsername("makemetalknow@gmail.com");
  getUnreadMailChoreo.setPassword("wlnsofkzqpvxadho");
  selectSerialPort(); 
  background(255);
}


void draw() {
  int emailsToRead = getUnreadEmails();
  println(emailsToRead);
  myPort.write(emailsToRead);
  delay(1*1000);
}



int getUnreadEmails() {
  // Run the Choreo and store the results
  GetUnreadMailResultSet getUnreadMailResults = getUnreadMailChoreo.run();
  // Print results
  return int(getUnreadMailResults.getFullCount());
}

