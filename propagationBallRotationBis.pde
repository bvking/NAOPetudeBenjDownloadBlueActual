//boolean doQ, doZ, doB; 

boolean propagationTrigged;
boolean doo=false;
boolean dol=false;
boolean doC=false;
/*
String modeStartKeyToFollow, keyMode;
     
float phaseMapped [] =  new float  [networkSize]; 
float newPosFollowed  [] =  new float  [networkSize]; 
float phaseMappedFollow  [] =  new float  [networkSize]; 
*/


void propagationBallRotationBis(){ // as addSignalOneAndTwoQuater() in NAOP 
modeStartKeyToFollow = " null ";


     textSize (50);
     text (" oldOscillatorChange " + oldOscillatorChange + " oscillatorChange " + oscillatorChange + " j " + nf (phaseKeptAtChange[oscillatorChange], 0, 2), -width, -height- 900+300 );
     text (" propagationTrigged " + propagationTrigged + " propagationSpeed " + propagationSpeed + " key " + key, -width, -height- 800+300  );
     text (" signal2  " +nf(signal[2], 0, 2) + " QpropWay " + doQ + " doZ " + doZ + " BlargerPhase " + doB , -width, -height- 700+300 );
     text (" lock " + dol + " oWay " + doo + " doC " + doC , -width, -height- 600+300 );
     text (" QpropWay " + doQ + " doZ " + doZ + " BlargerPhase " + doB , -width, -height- 500+300   );
     text (" oldSignalToSplit " + oldSplitTime + " splitTime " +  splitTime + " timeLFO " + timeLfo,  -width, -height- 400+300  );
     text (" oldSignalToSplit " + nf (oldSignalToSplit, 0, 2) + " signalToSplit " +     nf (signalToSplit, 0, 2) + " timeLFO " + timeLfo,  -width, -height );
     
  
 //  if (key=='q' || key=='b' || key=='z' || key=='#' || key=='o' || key=='l'  ) { // q == addsignal
     letter = key;   
//     }
     
  switch(letter) {
    case 'o': // way of rotation
    doo=!doo;
    key = '#';
  //  return letter;
  
    break;

    case 'c': 
    doC=!doC;
    key = '#';
    break;
 
    
    case 'l': // enable propagation or lock
      dol=!dol;
    key = '#';

    break;
    case 'L': // disable propagation
    dol=false;

    break;
    case 'q': // way of propagation
    doQ=true;
    doZ=false;
    break;
    case 'b': 
    doQ=false;
    doZ=false;
    doB=!doB;
    key = '#';
    break;

    

    case 'B': 
    doQ=false;
    doZ=false;
  //  doB=false;

    break;
    case 'z': // change way of propagation
    doZ=true;
    doQ=true;
    break;
    case '#': // change way of propagation
    
    break;
  //  doB=!doB;
    }

    switch(key) {
   case '#': // change way of propagation
    
    break;
      }
//   key = '#';
   
    
 
 // splitTimeScaleRotation(30.0); //  10.0= vitesse de propagation. On change de sens de ROTATION avec q et z.
 // splitTimeLfoScale();  // change de sens de PROPAGATION
 //  if (key == 'l' ) {
     

  
  
   if ( formerFormerKey == '#' || modeStartKeyToFollow == " null ") { // formerFormerKey == '#' || 
    
    println ( " modeStartKeyToFollow " + modeStartKeyToFollow);
        if (key == 'o' ) {
     //   signal[2]=- signal[2] ;
     for (int i = 0; i < networkSize-0; i+=1) { 
        newPosFollowed[i]=-newPosFollowed[i];
           }
           }
  

      for (int i = 0; i < networkSize-0; i+=1) {             
       newPosFollowed[i]=map (signal[2], 0, 1, 0, TWO_PI); // signals to follow
   //    newPosFollowed[i]=newPosFollowed[i]%TWO_PI;  // signals to follow
       phaseMapped[i] = newPosFollowed[i]+phaseMappedFollow[i]; // new signal is a composition 

      if (phaseMapped[i]<0){
      DataToDueCircularVirtualPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
      phaseMapped[i]= map (DataToDueCircularVirtualPosition[i], numberOfStep, 0, 0, -TWO_PI);  
       }
       
      else {
    
      DataToDueCircularVirtualPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep); 
      phaseMapped[i]= map (DataToDueCircularVirtualPosition[i], 0, numberOfStep, 0, TWO_PI);
       }


      newPosXaddSignal[i]=phaseMapped[i];
 
  }
  
 }
    //lockOscillatorToPositionFromPreviousProagedBall();
      //******** Lock last oscillator to the lastPhase

      if (  propagationTrigged==true && dol==true) {
      lockOscillatorToPositionFromPreviousProagedBall();
      for (int i = 0; i < networkSize-0; i+=1) { 
      phaseMappedFollow[i] = netPhaseBase[i];
      phaseMappedFollow[i] = phaseMappedFollow[i]%TWO_PI; 
      }
     }
    
 
 
      if (key != '#' ) {
      if (modeStartKeyToFollow == " null ") {
   //  phasePatternOriginal();
      phasePatternBase();

      for (int i = 0; i < networkSize-0; i+=1) {
  //  newPosFollowed[i]=netPhaseBase[i]; 
      phaseMappedFollow[i] = netPhaseBase[i];
    //  phaseMappedFollow[i] = phaseMappedFollow[i]%TWO_PI; 
       }
      }
     }


   propagationSpeed=70;
   splitTimeScaleRotation(propagationSpeed);
   propagation2wayRotationBis(); 
   mapDataToMotor();

     
     
  //  

 
 formerFormerKey= formerKey;   
 formerKey=key;
 
 }
 
 void propagation2wayRotationBis() {   // FAIRE CONDITION QUAND SIGNAL NEGATIF fu style
  //    if (newPosXaddSignal[oscillatorChange]<0){ 
  //    for (int i = 0; i <  networkSize-0; i+=1) { 
  //   newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], numberOfStep, 0, -TWO_PI, 0);
  //  }
  //    }
   
  //  B true O true OK
  // B true O false OK
  //        B false O false NO

    //   phaseKeptAtChange[oscillatorChange]=newPosXaddSignal[oldOscillatorChange];
   
   if (doC==true && doo==false ){ // // fonctionne avec o = false
  //     LFO[oscillatorChange] = LFO[oldOscillatorChange]+QUARTER_PI*1/2 ;  // on ajoute 
//++  phaseKeptAtChange[oscillatorChange]=LFO[oscillatorChange]%TWO_PI;

 //***  phaseKeptAtChange[oscillatorChange]= newPosXaddSignal[oscillatorChange]%TWO_PI;
//***   phaseKeptAtChange[oscillatorChange]= phaseKeptAtChange[oscillatorChange]+(PI/(2*networkSize)-1);


      LFO[oscillatorChange] = newPosXaddSignal[oscillatorChange]%TWO_PI;
   //   LFO[oscillatorChange] = LFO[oldOscillatorChange] - (PI/(6*networkSize)-1);
      LFO[oscillatorChange] = LFO[oldOscillatorChange] ;

        if (LFO[oscillatorChange]<0){ 
      for (int i = 0; i <  networkSize-0; i+=1) { 

   //    LFO[oscillatorChange]= map (LFO[oscillatorChange], - TWO_PI, 0, 0, TWO_PI);
    }
      }

    

       dataMappedForMotor[oldOscillatorChange]= (int) map (LFO[oldOscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       
              
       println (" MAIN true phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  LFO[oscillatorChange]);
       println (" MAIN doC==true && doo==false ");
      newPosXaddSignal[oldOscillatorChange]= map (dataMappedForMotor[oldOscillatorChange], 0, numberOfStep, 0, TWO_PI);
      newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
    
     }

      if (doC==true && doo==true && doB!=true ){ // // fonctionne avec o = false/ ajoute  ou retire )1 au compteur selon propa
  //     LFO[oscillatorChange] = LFO[oldOscillatorChange]+QUARTER_PI*1/2 ;  // on ajoute 
//++  phaseKeptAtChange[oscillatorChange]=LFO[oscillatorChange]%TWO_PI;

 //***  phaseKeptAtChange[oscillatorChange]= newPosXaddSignal[oscillatorChange]%TWO_PI;
//***   phaseKeptAtChange[oscillatorChange]= phaseKeptAtChange[oscillatorChange]+(PI/(2*networkSize)-1);


      LFO[oscillatorChange] = newPosXaddSignal[oscillatorChange]%TWO_PI;
      LFO[oscillatorChange] = LFO[oldOscillatorChange] + (PI/(3*networkSize)-1);
      text ( "  LFO[oscillatorChange] " + LFO[oscillatorChange], 900, 900 );
      println (" doC==true && doo==true && doB!=true ");

        if (LFO[oscillatorChange]<0){ 
    //  for (int i = 0; i <  networkSize-0; i+=1) { 

    //  LFO[oscillatorChange]= map (LFO[oscillatorChange], - TWO_PI, 0, 0, TWO_PI);
  //  }
      }

       dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       
      newPosXaddSignal[oldOscillatorChange]= map (dataMappedForMotor[oldOscillatorChange], 0, numberOfStep, 0, TWO_PI);
      newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
    
     }






   if (doB!=true && doC!=true){ // && propagationTrigged==true
  //     LFO[oscillatorChange] = LFO[oldOscillatorChange]+QUARTER_PI*1/2 ;  // on ajoute 
//++  phaseKeptAtChange[oscillatorChange]=LFO[oscillatorChange]%TWO_PI;

 //***  phaseKeptAtChange[oscillatorChange]= newPosXaddSignal[oscillatorChange]%TWO_PI;
//***   phaseKeptAtChange[oscillatorChange]= phaseKeptAtChange[oscillatorChange]+(PI/(2*networkSize)-1);

 if (doo==true){  // negative way : ccw
      print ( " newPosXaddSignal " + newPosXaddSignal[oscillatorChange]%TWO_PI );

      LFO[oscillatorChange] = newPosXaddSignal[oscillatorChange]%TWO_PI;
      LFO[oscillatorChange] = LFO[oscillatorChange] - (PI/(1*networkSize-1));

            println ( " LFO[oscillatorChange] " + LFO[oscillatorChange] );

   }       

  if (doo==false){


      LFO[oscillatorChange] = newPosXaddSignal[oscillatorChange]%TWO_PI;
      LFO[oscillatorChange] = LFO[oscillatorChange] + (PI/(3*networkSize-1));

            println ( " LFO[oscillatorChange] " + LFO[oscillatorChange] );


}
        if (LFO[oscillatorChange]<0){ 
      for (int i = 0; i <  networkSize-0; i+=1) { 

   //    LFO[oscillatorChange]= map (LFO[oscillatorChange], - TWO_PI, 0, 0, TWO_PI);
    }
      }

       if (LFO[oscillatorChange] <0){
      DataToDueCircularVirtualPosition[oscillatorChange]= int (map (LFO[oscillatorChange], 0, -TWO_PI, numberOfStep, 0)); 
      phaseMapped[oscillatorChange]= map (DataToDueCircularVirtualPosition[oscillatorChange], numberOfStep, 0, 0, -TWO_PI); 
      newPosXaddSignal[oscillatorChange]=phaseMapped[oscillatorChange]; 
       }
       
      else {
    
      DataToDueCircularVirtualPosition[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI, 0, numberOfStep); 
      phaseMapped[oscillatorChange]= map (DataToDueCircularVirtualPosition[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
      newPosXaddSignal[oscillatorChange]=phaseMapped[oscillatorChange]; 

       }

    //   dataMappedForMotor[oscillatorChange]=               phaseMapped[oscillatorChange];

     //  dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       
       println (" MAIN true phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oscillatorChange]);
      
       println (" LFO[oscillatorChange] ", LFO[oscillatorChange], " " ,  phaseKeptAtChange[oscillatorChange]);
       println (" doB!=true && doC!=true] ", oldOscillatorChange, " " ,  phaseKeptAtChange[oldOscillatorChange]);

  //    newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
       println (" newPosXaddSignal[oscillatorChange] ", newPosXaddSignal[oscillatorChange], " " );

    
     }





     
  
    if (doB==true && doC!=true){ 
      
         phaseKeptAtChange[oscillatorChange]= newPosXaddSignal[oscillatorChange]%TWO_PI;
         phaseKeptAtChange[oscillatorChange]= phaseKeptAtChange[oldOscillatorChange]+(PI/((2*networkSize)-1)); // on ajoute 
   //****    LFO[oscillatorChange] =LFO[oldOscillatorChange]+(PI/(2*networkSize-1)) ;  
  
    //   dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
        dataMappedForMotor[oscillatorChange]= (int) map (phaseKeptAtChange[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       
       println (" true phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oldOscillatorChange]);
      
       
     //   newPosXaddSignal[oldOscillatorChange]= map (dataMappedForMotor[oldOscillatorChange], 0, numberOfStep, 0, TWO_PI); // GOOD

         newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
     }

 



      for (int i = 0; i <  networkSize-0; i+=1) { 
   // net.phase[i]=newPosXaddSignal[i]; // to display to screen
   // net.phase[i]%=TWO_PI;
    }
 
///////////////////// 
 //  mapDataToMotor();


  }


void  splitTimeLfoScaleBis() {  // change de sens de propagagtion.   ATTENTION dans ce reglage le signalToSplit de propgation est UP continue de 0 à TWO_PI

    lfoPhase[1] = (frameCount / 10.0 * cos (1000 / 500.0)*-1)%TWO_PI;  // continue 0 to TWO_PI;
    lfoPhase[3] = map ((((cos  (frameCount / 30.0))*-1) %2), -1, 1, -TWO_PI, TWO_PI);  // sinusoidale lente
    lfoPhase[2] = map ((((cos  (frameCount / 50.0))*-1) %2), -1, 1, -TWO_PI, TWO_PI); // sinusoidale rapide
    
    println (" forme d'onde lfoPhase[1] ", lfoPhase[1], "lfoPhase[2] ", lfoPhase[2], "lfoPhase[3]= signalTosplit ", lfoPhase[3]); 

    oldSignalToSplit=signalToSplit;
    signalToSplit= lfoPhase[3];
 
  if (oldSignalToSplit> signalToSplit ) {
    key = 'q' ; // when signal goes down --> propagation FRONT SIDE
   timeLfo= map (signalToSplit, TWO_PI, -TWO_PI, 0, 1000);  //  if we have an oscillation as  lfoPhase[3]
    }
  else if (oldSignalToSplit< signalToSplit ) { // on est dans cette configuration avec  signalToSplit= lfoPhase[1]
   key = 'z';  //  when signal goes down --> propagation BEHIND SIDE 
//   key = 'q' ;  // propagation in on the same way
   timeLfo= map (signalToSplit, -TWO_PI, TWO_PI, 0, 1000);  // if we have an oscillation  lfoPhase[3]
 //**   timeLfo= map (signalToSplit, 0, TWO_PI, 0, 1000);  // if we have a continuois from 0 to TWO_PI 
 //   timeLfo= map (signalToSplit, 0, 1, 0, 1000); //  if we have a continuois from 0 to TWO_PI from an other software
 
   }

  int splitTimeLfo= int  (timeLfo%100);   // 100 is the size of the gate trigging the change of the ball  
   
      println ( " oldSignalToSplit " + oldSignalToSplit + " signalToSplit " + signalToSplit );
      print (" timeLfo "); print ( timeLfo );   print (" splittimeLfo "); println ( splitTimeLfo );


 if (doZ==false){  // case q
  if (oldSplitTimeLfo>splitTimeLfo){

      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
   } 
      oscillatorChange=oscillatorChange%networkSize;
      
  if (oscillatorChange<=0) {
  //    oscillatorChange=0;
      oldOscillatorChange=networkSize-1;
   } 
  }
  
 if (doZ==true){ // case z
  if (  oldSplitTimeLfo>splitTimeLfo){

      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange-1;
   } 
      if (oscillatorChange<=-1) {

      oldOscillatorChange=0;
      oscillatorChange=networkSize-1;
   }
  }  

  if ( oldOscillatorChange!=oscillatorChange )
  {
   oscillatorChanged=true;
  } 
   oldSplitTimeLfo = splitTimeLfo;
             
}

 void  splitTimeScaleRotation(float propagationSpeed) { 
   

         signal[2] = (0*PI + (frameCount / propagationSpeed) * cos (1000 / 500.0)*-1); //%1 TWO_PI
     if (doo==true  ){      
          signal[2] = -  signal[2]; //%1
       }    
      //   (if signal is sinusoidale we will see good propagation)
      
  //   signal[2]=   map (((cos  (frameCount / 100.0)*-1) %2), -1, 1, -TWO_PI, TWO_PI);  // sinusoida
 // signal[2]=   map (((cos  (frameCount / 100.0)*-1) %2), -1, 1, -1, 1);  // sinusoida
   
         
    if (doZ==false  ){  // case q && timeLfo>=0
      propagationTrigged=false;
  if (oldSplitTimeLfo>splitTimeLfo){
    
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
      propagationTrigged=true;
   } 

      oscillatorChange=oscillatorChange%networkSize;
     if (oscillatorChange<=0) {
    
         oscillatorChange=0;
         oldOscillatorChange=networkSize-1;
   } 
  }
  
  
//    if (doZ==false && timeLfo<=0  ){ // doZ==true  // doZ==false with signal sinusoidale
//   if (oldSplitTimeLfo<splitTimeLfo){ //  if (  oldSplitTimeLfo>splitTimeLfo){  //  if (oldSplitTimeLfo<splitTimeLfo)  signal sinusoidale


    if (doZ==true   ){ 
   propagationTrigged=false;
  if (  oldSplitTimeLfo>splitTimeLfo){ 

       oldOscillatorChange=oscillatorChange;

      oscillatorChange=oscillatorChange-1;
       propagationTrigged=true;
   } 
      if (oscillatorChange<=-1) {

        oldOscillatorChange=0;

        oscillatorChange=networkSize-1;
   }
  }       
  

   timeLfo = ((int ) map (signal[2], 0, 1, 0, networkSize*100)); // linear  pattern if signal [2] is linear
      if (doo==true  ){      
          timeLfo = -  timeLfo; //%1
       } 
 
       text ( "   SPLIT TIME  timeLfoooooooooo " + " timeLfo   " + timeLfo, -width-200, +height-100  );
        text (" oldSplitTimeLfo " + oldSplitTimeLfo + " splitTime " +   splitTimeLfo + " timeLFO " + timeLfo,  -width-200, +height );

   oldSplitTimeLfo=splitTimeLfo;
   splitTimeLfo= int  ((timeLfo)%100)+0;    // the time is splitted at each %100. That mean ten time from the beginning to the end of signal[2]. from 0 to 1.
   
}

  void lockOscillatorToPositionFromPreviousProagedBall() { 

  if (propagationTrigged==true && propagationTrigged==true) { //  works always ?  formerFormerKey  == '#'
//   oscillatorChanged=true;
    
  int i;
  i= oscillatorChange;

  int h;
  h= oscillatorChange+1;
  h%=networkSize;
  
  int j;  
  j= (oscillatorChange-1);
  if (j<= -1){
  j= networkSize-1;
  }
  
  int k;  
  k= (j-1);
  if (k<= -1){
  k= networkSize-1;
  }
  
  int l;  
  l= (k-1);
  if (l<= -1){
  l= networkSize-1;
  }
  
  int m;  
  m= (l-1);
  if (m<= -1){
  m= networkSize-1;
  }
      
 // if (oscillatorChanged==true )  {  // just one frame to change
    if (propagationTrigged==true || propagationTrigged==false )  { 
    
  //  if (  LFO[i]<0){  
   if ( newPosXaddSignal[i]%TWO_PI<0){ 
      

    phaseKeptAtChange[i]=newPosXaddSignal[h]%TWO_PI;  // the position of the actual changing ball is at the position of the prevous propaged ball
    dataMappedForMotor[i]= int (map ( phaseKeptAtChange[i], 0, -TWO_PI, numberOfStep, 0)); 
    
              println (" < phaseKeptAtChange[oscillatorChange]  i ", i , " " , oscillatorChange, " " ,  phaseKeptAtChange[oscillatorChange]);


       netPhaseBase[i]= map (dataMappedForMotor[i], numberOfStep, 0, 0, -TWO_PI);

   
  }
       
   else
 
       phaseKeptAtChange[i]=newPosXaddSignal[h]%TWO_PI;
              println (" > phaseKeptAtChange[oscillatorChange]  i ", i , " " , oscillatorChange, " " ,  phaseKeptAtChange[oscillatorChange]);

     //  LFO[j] = LFO[j]%TWO_PI;
       dataMappedForMotor[i]= (int) map (phaseKeptAtChange[i], 0, TWO_PI, 0, numberOfStep);

       netPhaseBase[i]= map (dataMappedForMotor[i], 0, numberOfStep, 0, TWO_PI);
 
  
   }
    
 //   phaseMappedFollow[i]=netPhaseBase[i];    //  RECORD on oscillatorChange-1 the postion of oscillatorChange where it has just changed   //  phaseMappedFollow[oscillatorChange]= phaseKeptAtChange[oscillatorChange]; 



/*
         for (int p = 0; i < networkSize-0; i+=1) { 
   // phaseMappedFollow[i]= net.phase[i];// add offset given by pendularPattern   
  //  phaseMappedFollow[i] = netPhaseBase[i];
    phaseMappedFollow[p]= phaseMappedFollow[p]%TWO_PI;  
    }

       LFO[l] = LFO[l]%TWO_PI;
       dataMappedForMotor[l]= (int) map (LFO[l], 0, TWO_PI, 0, numberOfStep);
            
       netPhaseBase[l]= map (dataMappedForMotor[l], 0, numberOfStep, 0, TWO_PI);
 


       LFO[k] = LFO[k]%TWO_PI;
       dataMappedForMotor[k]= (int) map (LFO[k], 0, TWO_PI, 0, numberOfStep);
 
      
       netPhaseBase[k]= map (dataMappedForMotor[k], 0, numberOfStep, 0, TWO_PI);
  */
  //netPhaseBase[k] = netPhaseBase[k]-QUARTER_PI*0; // %TWO_PI;
  //     netPhaseBase[k] %=TWO_PI;

  //     netPhaseBase[j] = netPhaseBase[j]-QUARTER_PI*0; // %TWO_PI;
  //     netPhaseBase[j] %=TWO_PI;
       
   //    dataMappedForMotor[j]= (int) map (netPhaseBase[j], 0, TWO_PI, 0, numberOfStep);
  //     println (" phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oscillatorChange]);
  //     netPhaseBase[j]= map (dataMappedForMotor[j], 0, numberOfStep, 0, TWO_PI);

  //   oscillatorChanged=false;
 
   
       println ("  phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oscillatorChange]);
       println ("  phaseKeptAtChange[oldOscillatorChange] ", oldOscillatorChange, " " ,  phaseKeptAtChange[oldOscillatorChange]);
     }
   
}  