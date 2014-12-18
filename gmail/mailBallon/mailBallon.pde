/*
Making Thing Talk - Workshop Elisava - DEC 2014
https://live.temboo.com/library/Library/Google/Gmail/
*/

import com.temboo.core.*;
import com.temboo.Library.Google.Gmail.*;

// Create a session using your Temboo account application details
TembooSession session = new TembooSession("pral2a", "myFirstApp", "c7367f78-074d-4888-b");

// Create the Choreo object using your Temboo session
GetUnreadMail getUnreadMailChoreo = new GetUnreadMail(session);

void setup() {
  size(500, 500);
  getUnreadMailChoreo.setUsername("makemetalknow@gmail.com");
  getUnreadMailChoreo.setPassword("wlnsofkzqpvxadho");
  noStroke();
}


void draw() {
  background(255);
  int emailsToRead = getUnreadEmails();
  float ballonSize = map(emailsToRead, 0, 15, 0, width);
  fill(200, 255, 0);
  ellipse(width/2, height/2, ballonSize, ballonSize);
  delay(1*1000);
}



int getUnreadEmails() {
  // Run the Choreo and store the results
  GetUnreadMailResultSet getUnreadMailResults = getUnreadMailChoreo.run();
  // Print results
  return int(getUnreadMailResults.getFullCount());
}
