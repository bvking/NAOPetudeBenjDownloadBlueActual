void switchFonctionDependingKeyMode() {

 if (  keyMode == " trigEventWithAbletonSignal " || keyModeRed == " trigEventWithAbletonSignal " ) {
    //  formerKeyMetro = '@';       
          //  modeStartKeyToFollow = " trigEventWithAbletonSignal ";
            trigEventWithAbletonSignal();
      text ( keyMode, -width, -height); 
       }
     
      if (keyMode == " addSignalOneAndTwoQuater " || keyModeRed == " addSignalOneAndQuater " ) { //drive ball with lfo
    //   PatternFollowLfo();
     propagationMode();
      text ( keyMode, -width, -height); 
    }
   
    if (keyMode == " addSignalOneAndTwoTer " || keyModeRed == " addSignalOneAndTwoTer " ) { //drive ball with lfo
    //   PatternFollowLfo();
     addSignalOneAndTwoTer();
      text (" ALT a " + keyMode, -width, -height); 
    }
    
    
    if (keyMode == " addSignalOneAndTwoBis " || keyModeRed == " addSignalOneAndTwoBis " ) { //drive ball with lfo
    //   PatternFollowLfo();
     addSignalOneAndTwoBis();
      text ( keyMode, -width, -height); 
    }  

  if (keyMode == " addSignalOneAndTwo " || keyModeRed == " addSignalOneAndTwo " ) { //drive ball with lfo
    //   PatternFollowLfo();
     addSignalOneAndTwo();
      text ( " ALT z " + keyMode, -width, -height); 
    }
  
  if (keyMode == " methodAbleton " || keyModeRed == " methodAbleton ") { //drive ball with lfo
     methodAbleton();
     text ( keyMode, -width, -height); 
     
  }
  
  if (keyMode == " followDirectLfo " || keyModeRed == " followDirectLfo ") { //drive ball with lfo
     followDirectLfo();
      text ( keyMode, -width, -height); 
  }
  
  if (keyMode == " followDistribueAddphasePattern " || keyModeRed == " followDistribueAddphasePattern ") { //drive ball with lfo
     followDistribueAddphasePattern();
      text ( keyMode, -width, -height); 
  }
  
  if (keyMode == " followDistribueAddLfoPatternBis " || keyModeRed == " followDistribueAddLfoPatternBis ") { //drive ball with lfo
     followDistribueAddLfoPattern();
      text ( keyMode, -width, -height); 
  }
  
    if (keyMode == " samplingMode " || keyModeRed == " samplingMode ") { //drive ball with lfo
  //   followDistribueAddLfoPattern();
     text ( keyMode, -width, -height);
  }
  
  
  
  if (keyMode ==  " followDistribueAddLfoPatternControl " || keyModeRed == " followDistribueAddLfoPatternControl ") { // drive with CONTROL & r
       if (key!='#'){
    controlTrigLfoPattern = millis();
    }
   //  followDistribueAddLfoPatternControl();
  }


      if (keyMode == " propagationBallRotation " || keyModeRed == " propagationBallRotationRec ") { 
        propagationBallRotation();
     text (" Alt t " + keyMode, -width*2, -height*3);
  }

     if (keyMode == " propagationBallRotationBis " || keyModeRed == " propagationBallRotationBis ") { 
        propagationBallRotationBis();
     text (" Alt y " + keyMode, -width*2, -height*3);
  
  }


  
  if (keyMode == " null " || keyModeRed == " null ") { //drive ball with lfo
    //  followDistribueAddLfoPattern();
      text (keyMode, (width/2), height/2);  

  }
  
   if (keyMode == " phasePattern " ) { //drive ball with lfo
    //  followDistribueAddLfoPattern();
   // followDistribueAddLfoPattern();
    // phasePattern();
      text (keyMode + " " + signal[5] , (width/2), height/2); 
    

  }
  
     if (keyMode == " abletonPattern " ) { //drive ball with lfo
    //  followDistribueAddLfoPattern();
      abletonPattern();
      text (keyMode, (width/2), height/2);  

  }


    if (keyMode == " signal "){ // || formerKeyMetro == 'J'
         text ( keyMode, -width, -height); 
    for (int i = 2; i <  networkSize; i++) {
    net.oldPhase[i] =  net.phase[i]; 
    net.phase[i] =  map (signal[i], 0, 1, 0, TWO_PI);   //  
    println ( " signalTo_net.phase ", (i), net.phase[i] );
    
    if (net.oldPhase[i]>net.phase[i]){
   
     DataToDueCircularVirtualPosition[i]= int (map (net.phase[i], TWO_PI, 0, numberOfStep, 0)); 
     net.oldPhase[i]=net.phase[i];
   
     }
       
     else
    
    DataToDueCircularVirtualPosition[i]= (int) map (net.phase[i], 0, TWO_PI, 0, numberOfStep); 
    net.oldPhase[i]=net.phase[i];
  

     }
   //  sendToTeensy();
     }

  }