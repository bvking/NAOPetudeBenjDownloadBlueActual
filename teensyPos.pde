void teensyPos(){

    if (modeStartKeyToFollow == " null ") {  
    
  for (int i = 0; i < networkSize; i++) {  
 //   DataToDueCircularVirtualPosition[i]=(int) newPosF[i]+ (rev[i]*numberOfStep);  // map motor with countrevs
 DataToDueCircularVirtualPosition[i]=(int) newPosF[i]+ (revLfo[i]*numberOfStep);
 
    }
       send24DatasToTeensy6motors( 4, 3, -3, -1);
   }
 if (modeStartKeyToFollow != " null ") { 
  for (int i = 0; i < networkSize; i++) {

    //rev[i]=rev[0];

    //*******************************  ASSIGN MOTOR WITH POSITION
    //   pos[i]= pos[i]-numberOfStep/4; // The positions 0 of my motors in real are shifted of - half_PI  

    if (rev[i]!=0  && (net.phase[i] >  0) ) { // number of revolution is even and rotation is clock wise   
     DataToDueCircularVirtualPosition[i]= int (map (net.phase[i], 0, TWO_PI, 0, numberOfStep))+ rev[i]*numberOfStep;
    }

    //   if (rev[i]!=0  && (net.phase[i] <  0)) { // number of revolution is even and rotation is Counter clock wise   
    if (rev[i]!=0  && (net.phase[i] <  0)) { // number of revolution is even and rotation is Counter clock wise   

      DataToDueCircularVirtualPosition[i]= int (map (net.phase[i], 0, -TWO_PI, numberOfStep, 0))+ rev[i]*numberOfStep;
    }

    if (rev[i]==0 && (net.phase[i] < 0) ) { //  number of revolution is 0 and rotation is counter clock wise 
      DataToDueCircularVirtualPosition[i]= int (map (net.phase[i], 0, -TWO_PI, numberOfStep, 0));        
      //    print ("pos "); print (i); print (" CCW rev=0");println (pos[i]);
    }         
    if  (rev[i]==0 && (net.phase[i] > 0) ) {  //  number of revolution is 0 and rotation is clock wise     
      DataToDueCircularVirtualPosition[i]= int (map (net.phase[i], 0, TWO_PI, 0, numberOfStep));         
    }
  }
   send24DatasToTeensy6motors( 3, 3, -3, -1);
  }
 

   }

void mapDataToMotor() {

  println (" CONVERSION pour AFFICHAGE net.phase[i]=newPosXaddSignal[i ]");


    for (int i = 0; i <  networkSize-0; i+=1) { 
    newPosXaddSignal[i]%=TWO_PI;
    net.phase[i]=newPosXaddSignal[i]; // to display to screen
    
    }


  countRevs();
     for (int i = 0; i <  networkSize-0; i+=1) {
     net.oldPhase[i]=net.phase[i];

    }


    // map depending way of rotation

   

      for (int i = 0; i <  networkSize-0; i+=1) { // la premiere celle du fond i=2,  la derniere celle du devant i=11
   //  if ( newPosXaddSignal[i]>0 )  {
     positionToMotor[i]= ((int) map (newPosXaddSignal[i], 0, TWO_PI, 0, numberOfStep)%numberOfStep); //
     newPosF[i]=positionToMotor[i]%6400;
   
    // if ( newPosXaddSignal[i]<0 )  {
       if (net.oldPhase[i] > net.phase[i] ) {

     positionToMotor[i]= ((int) map (newPosXaddSignal[i], 0, -TWO_PI,  numberOfStep, 0)%numberOfStep); //
     newPosF[i]=positionToMotor[i]%6400;
   }

   //  newPosF[i]=positionToMotor[i]%6400;
   }
   // }
    

    
    
    

     for (int i = 0; i <  networkSize-0; i+=1) { 

     TrigmodPos[i]=1;
      
      if (net.oldPhase[i] > 0 ) {

    if ( oldPosF[i]>newPosF[i]) { //
         revLfo[i]++;
         TrigmodPos[i]=0;
     
    }
     }
    
   //  if ( oldPosF[i]>newPosF[i] ){  // && newPosXaddSignal[i]>-HALF_PI &&  newPosXaddSignal[i]< HALF_PI 
    text (  " net.oldPhase[i] " + net.phase[i] + " " + newPosXaddSignal[i] + " oldOldPosF " + oldOldPosF[i] + " oldPosF " + oldPosF[i] + " newPosF " + newPosF[i], width*2, i*50);
    print (  newPosXaddSignal[i] + " oldOldPosF " + oldOldPosF[i] + " oldPosF " + oldPosF[i] + " newPosF " + newPosF[i]);

    if ((doC==true && doo==true && doB!=true )!=true){
 textSize (100);
    if (net.oldPhase[i] < 0 ) {

    if ( (newPosF[i]>oldPosF[i]) && (oldPosF[i]<oldOldPosF[i])){ 
         revLfo[i]--;
         TrigmodPos[i]=2;
     
      }
     }
    }
     

    textSize(50);

     print (" TrigmodPos[i" , TrigmodPos[i]);

     oldPositionToMotor[i]=  positionToMotor[i];
     oldOldPosF[i]=oldPosF[i];
     oldPosF[i]=newPosF[i];
     oldPosX[i]=newPosF[i];

   
     print (" revLFO "); print ( i); print ("  "); println (revLfo[i]);   
     text ("count", -1600, height-500 - 75*i);
     text ( revLfo[i], -1400, height-500 - 75*i);
     }
     
     text (" mode " + keyMode , -1600, height-300 );  
     text ( signal[2], -400, height-300);

  
    teensyPos();
     oscSend(); // depend de arduinopos
   //  assignMotorWithPosition();
     
    for (int i = 0; i < networkSize; i++) {
   //  DataToDueCircularVirtualPosition[i] = DataToDueCircularVirtualPosition[i]+ recordLastDataOfMotorPosition[i];
   }

 //  send24DatasToTeensy6motors( 10, 3, -3, -1);
  
}
