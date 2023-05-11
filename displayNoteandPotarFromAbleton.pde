void displayNoteandPotarFromAbleton(){ 
string1.display(ver_move1);
  string2.display(ver_move2);
  string3.display(ver_move3);
  string4.display(ver_move4);
  string5.display(ver_move5);
  string6.display(ver_move6);
  string7.display(ver_move7);
  string8.display(ver_move8);

  if (ver_move1>0) {
    ver_move1 = ver_move1 -duration1;
  }
  if (ver_move2>0) {
    ver_move2 = ver_move2 -duration2;
  }
  if (ver_move3>0) {
    ver_move3 = ver_move3 -duration3;
  }
  if (ver_move4>0) {
    ver_move4 = ver_move4 -duration4;
  }
  if (ver_move5>0) {
    ver_move5 = ver_move5 -duration5;
  }
  if (ver_move6>0) {
    ver_move6 = ver_move6 -duration6;
  }
  if (ver_move7>0) {
    ver_move7 = ver_move7 -duration7;
  }
  if (ver_move8>0) {
    ver_move8 = ver_move8 -duration8;
  }

  ver_move1 = - ver_move1;
  ver_move2 = - ver_move2;
  ver_move3 = - ver_move3;
  ver_move4 = - ver_move4;
  ver_move5 = - ver_move5;
  ver_move6 = - ver_move6;
  ver_move7 = - ver_move7;
  ver_move8 = - ver_move8;

  //potar data move the circle

  //OSC RECEIVE
  print(" automation3 followMadTrack  "); 
  print (automation3);
  incrementSpeed+=10;
  incrementSpeed=incrementSpeed%width;

  float ver_move = (float) incrementSpeed;
  float triangularLFO = map(automation2, 0, 1, -300, 300); //FollowLFO   .. used to autmationWithMeasureAndNote()
  float hor_move = map(automation3, 0, 1, -300, 300);  // //followMad

  float RColour = map(automation7, 0, 1, 0, 255);
  // float GColour = map(automation4, 0, 1, 0, 255);
  float LFO1= map(automation6, 0, 1, 0, 255);
  float LFO2= map(automation7, 0, 1, 0, 255);

  float BColour = map(automation3, 0, 1, 0, 255);
  //  float XSize = map(automation6, 0, 1, 10, 80);
  float XSize = map(automation1, 0, 1, 10, 80);
  float YSize = map(automation3, 0, 1, 0, 320);
  
   float LFOphase1 = map(automation6, 0, 1, -300, 300);
   float LFOphase2 = map(automation7, 0, 1, -300, 300);
  //  fill(RColour, GColour, BColour);
  ellipse(ver_move, hor_move, 50, 50);
  ellipse(ver_move, triangularLFO, XSize, YSize);
//  ellipse(ver_move, LFOphase1, XSize, YSize); // seeAutomationAreverbershaper
//  ellipse(ver_move, LFOphase2, XSize, YSize); // seeAutomationAreverbershaper
  
  stroke (255,255,0);
  
    ellipse(ver_move, LFO1, XSize, YSize); // seeAutomationAreverbershaper
    
    ellipse(ver_move, LFO2, XSize, YSize); // seeAutomationAreverbershaper
  
  noStroke();
  //  ellipse(400, 400, GColour, GColour);

      }