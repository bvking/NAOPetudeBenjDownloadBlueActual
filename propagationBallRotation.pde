boolean doB; // 
/*
String modeStartKeyToFollow, keyMode;
     
float phaseMapped [] =  new float  [networkSize]; 
float newPosFollowed  [] =  new float  [networkSize]; 
float phaseMappedFollow  [] =  new float  [networkSize]; 
*/

void propagationBallRotation(){ // as addSignalOneAndTwoQuater() in NAOP 
// modeStartKeyToFollow = " followSignalSampledOppositeWay(frameRatio) ";
 modeStartKeyToFollow = " null ";
 keyMode = " propagationBallRotation ";


     textSize (75);
     text ("Change mode q, z, or stop progation with b ", -width-200, -height- 600 );
     text ("signal2 " +nf(signal[2], 0, 2) + " doQ " + doQ + " doZ " + doZ + " doB " + doB , -width-200, -height- 500 );
 //    text ("signal3 " + signal[3], -width-200, -height- 400 );
     text (" oldSignalToSplit " + oldSplitTime + " splitTime " +  splitTime + " timeLFO " + timeLfo,  -width-200, -height- 400 );
     text (" oldSignalToSplit " + nf (oldSignalToSplit, 0, 2) + " signalToSplit " +     nf (signalToSplit, 0, 2) + " timeLFO " + timeLfo,  -width-200, -height- 300 );
     text (" oldOscillatorChange " + oldOscillatorChange + " oscillatorChange " + oscillatorChange + " j " + nf (phaseKeptAtChange[oscillatorChange], 0, 2), -width-200, -height- 200 );
     text (" propagationSpeed " + propagationSpeed + " key " + key, -width-200, -height- 100 );
     
  
   if (key=='q' || key=='b' || key=='z' || key=='#' ) { // q == addsignal
     letter = key;   
     }
     
  switch(letter) {
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
    case 'z': // change way of propagation
    doZ=true;
    doQ=true;
    break;
    case '#': // change way of propagation
    
    break;
  //  doB=!doB;
    }
    
  //  key = '#';

  
  
   if (formerFormerKey == '#' || keyMode == " propagationBallRotation ") {
    

      for (int i = 0; i < networkSize-0; i+=1) {       
       newPosFollowed[i]=map (signal[2], 0, 1, 0, TWO_PI); // signals to follow  // +i*QUARTER_PI
   //    newPosFollowed[i]=newPosFollowed[i]%TWO_PI;  // signals to follow
       phaseMapped[i] = newPosFollowed[i]+phaseMappedFollow[i]; // new signal is a composition 
       phaseMapped[oscillatorChange]=   phaseMapped[oscillatorChange]+   LFO[oscillatorChange];     //      newPosXaddSignal[oscillatorChange];
   
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



    if (key != '#' ) {
    if (keyMode == " propagationBallRotation ") {
     phasePatternBase();
     
    for (int i = 0; i < networkSize-0; i+=1) { 
   // phaseMappedFollow[i]= net.phase[i];// add offset given by pendularPattern   
      phaseMappedFollow[i] = netPhaseBase[i];
   // phaseMappedFollow[i]= phaseMappedFollow[i]%TWO_PI;  
    }
   }
  }

    //******** Lock last oscillator to the lastPhase
    
    // lockOscillatorToPositionFromPreviousProagedBall();

     propagationSpeed=40;
     splitTimeScale(propagationSpeed); //  10.0= vitesse de propagation. On change de sens de ROTATION avec q et z.
  // splitTimeLfoScale();  // change de sens de PROPAGATION

    propagation2way(); 
    mapDataToMotor();
   for (int i = 0; i <  networkSize-0; i+=1) { 
    net.phase[i]=newPosXaddSignal[i]; // to display to screen
    net.phase[i]%=TWO_PI;
    }

   // lockOscillatorToPositionFromPreviousProagedBall();

 
 formerFormerKey= formerKey;   
 formerKey=key;
 }
 
 void propagation2way() { 


    //   phaseKeptAtChange[oscillatorChange]=newPosXaddSignal[oldOscillatorChange];
   
   
   if (doB!=true){ 

    //     LFO[oscillatorChange] =LFO[oscillatorChange]+QUARTER_PI*1/2 ;  // on ajoute 
       LFO[oscillatorChange] =LFO[oldOscillatorChange]+QUARTER_PI*8+QUARTER_PI*1/2 ;  // on ajoute 
       LFO[oscillatorChange] =  LFO[oscillatorChange] %TWO_PI;
       dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       println (" true phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oldOscillatorChange]);
 
     //  newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
      LFO[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
     }
   /*  
    if (1==1){ 

       LFO[oscillatorChange] =LFO[oldOscillatorChange]+QUARTER_PI*1/2 ;  // on ajoute 
       LFO[oscillatorChange] =  LFO[oscillatorChange] %TWO_PI;

       dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       println (" true phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oldOscillatorChange]);
      
       newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
       // newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oldOscillatorChange], 0, numberOfStep, 0, TWO_PI);
     }
  */   
     
    if (doB==true){ 

       LFO[oscillatorChange] =LFO[oldOscillatorChange]+QUARTER_PI*1/2+PI ;  // on ajoute 
     //  LFO[oscillatorChange] =  LFO[oscillatorChange] %TWO_PI;

       dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       println (" true phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oldOscillatorChange]);
      
       newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
       // newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oldOscillatorChange], 0, numberOfStep, 0, TWO_PI);
     }
 
        for (int i = 0; i <  networkSize-0; i+=1) { 
    net.phase[i]=newPosXaddSignal[i]; // to display to screen
    net.phase[i]%=TWO_PI;
    }
///////////////////// 
  // mapDataToMotor();
  // modePendulaireModeCirculaire();
 //  send24DatasToTeensy6motors(5, -3, -3, -1);

 for (int k = 0; k < this.nbBalls; k++) 
    {    
    //    drawBall(k, newPosXaddSignal[k] );  
    //    print (" newPosXaddSignal[k] " + newPosXaddSignal[k]); 
    } 
  }


void  splitTimeLfoScale() {  // change de sens de propagagtion.   ATTENTION dans ce reglage le signalToSplit de propgation est UP continue de 0 à TWO_PI

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

 void  splitTimeScale(float propagationSpeed) { 
   

         signal[2] = (0*PI + (frameCount / propagationSpeed) * cos (1000 / 500.0)*-1); //%1
         
      //   (if signal is sinusoidale we will see good propagation)
      
  //   signal[2]=   map (((cos  (frameCount / 100.0)*-1) %2), -1, 1, -TWO_PI, TWO_PI);  // sinusoida
 // signal[2]=   map (((cos  (frameCount / 100.0)*-1) %2), -1, 1, -1, 1);  // sinusoida
   
         
    if (doZ==false  ){  // case q && timeLfo>=0
  if (oldSplitTimeLfo>splitTimeLfo){
 
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
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
  if (  oldSplitTimeLfo>splitTimeLfo){ 

       oldOscillatorChange=oscillatorChange;

      oscillatorChange=oscillatorChange-1;
   } 
      if (oscillatorChange<=-1) {

        oldOscillatorChange=0;

        oscillatorChange=networkSize-1;
   }
  }       
  
       println ( " ***************************************************    SPLIT TIME  timeLfoooooooooo " + " signal[2] " + signal[2] + " oldSplitTime " + oldSplitTime + " splitTime " + splitTime );

   timeLfo = ((int ) map (signal[2], 0, 1, 0, 1000)); // linear  pattern if signal [2] is linear
 
       println ( " ***************************************************    SPLIT TIME  timeLfoooooooooo " + " timeLfo   " + timeLfo );
        text (" oldSignalToSplit " + oldSplitTimeLfo + " splitTime " +   splitTimeLfo + " timeLFO " + timeLfo,  -width-200, +height );

   oldSplitTimeLfo=splitTimeLfo;
   splitTimeLfo= int  (timeLfo%100);    // the time is splitted at each %100. That mean ten time from the beginning to the end of signal[2]. from 0 to 1.
   
}


void displayValue(int value){
   textSize (100);
   text (value, width - 100, 100);
}

void displayText(String text)
{
  if(null == text){
     return;
  }
  
   fill(255);
   textSize (20);
   text (text, width - 150, 600);
}