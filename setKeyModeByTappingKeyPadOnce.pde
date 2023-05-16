 void setKeyModeByTappingKeyPadOnce()
 
 {
  
    if (moveKeys[0]==true){ // CONTROL && a pressed
 //   mappingMode = " circular " ;
    print (" ***************** ", mappingMode);
    }
    
    if (moveKeys[1]== true){ // CONTROL a && z pressed
 //   mappingMode = " pendular " ;
    print (" ***************** ", mappingMode);   
    }  

    if (moveKeys[8]==true && moveKeys[0]==true){ // CONTROL && a pressed
  //  keyMode = " signal " ;
    keyMode = " addSignalOneAndTwoTer " ;
  // formerKeyMetro = '@';
    print (" keyMode ", keyMode );
    }
  
    if (moveKeys[8]==true && moveKeys[1]==true){ // CONTROL && z pressed
    keyMode = " addSignalOneAndTwo " ;
   // formerKeyMetro = '@';
    print (" keyMode ",  keyMode );
    }
    
    if (moveKeys[8]==true && moveKeys[2]==true){ // CONTROL && e pressed
    keyMode = " addSignalOneAndTwoBis "  ;
  //  formerKeyMetro = '*';
    print (" keyMode ",  keyMode );
    }

    if (moveKeys[8]==true && moveKeys[10]==true){ // CONTROL && r pressed
    keyMode = " addSignalOneAndTwoQuater "  ;
  //  formerKeyMetro = '*';
    print (" keyMode ",  keyMode );
    }

    if (moveKeys[8]==true && moveKeys[13]==true){ // ALT && t pressed
    keyMode = " propagationBallRotation "  ;
  //  formerKeyMetro = '*';
    print ("Alt t + keyMode ",  keyMode );
    }


    if (moveKeys[8]==true && moveKeys[16]==true){ // ALT && t pressed
    keyMode = " propagationBallRotationBis "  ;
  //  formerKeyMetro = '*';
    print ("Alt y + keyMode ",  keyMode );
    }


        
    if (moveKeys[8]==true && moveKeys[3]==true){ // CONTROL && q pressed
    keyMode = " followDirectLfo " ;
    formerKeyMetro = '@';
    print (" keyMode ",  keyMode );
    }
    
    if (moveKeys[8]==true && moveKeys[4]==true){ // CONTROL && s pressed
    keyMode = " followDistribueAddphasePattern " ;
    
    formerKeyMetro = '*';
    print (" keyMode ",  keyMode );
    }
    
    if (moveKeys[8]==true && moveKeys[5]==true){ // ALT && d pressed
    keyMode = " followDistribueAddLfoPattern " ;
    
    formerKeyMetro = '*';
    print (" keyMode ",  keyMode );
    }
    
    if (moveKeys[8]==true && moveKeys[6]==true){ //ALT && w pressed
    keyMode = " samplingMode " ;
    
   // formerKeyMetro = '*';
    print (" keyMode ",  keyMode );
    }
    
    if (moveKeys[8]==true && moveKeys[7]==true){ // ALT && x pressed
    keyMode = " null " ;
    
   //formerKeyMetro = '*';
    print (" keyMode ",  keyMode, " formerKeyMetro ", formerKeyMetro );
    }
    
   if (moveKeys[8]==true && moveKeys[9]==true){ // ALT && c pressed  moveKeys[9]==true  //  r pressed  moveKeys[10]==true
    keyMode = " followDistribueAddLfoPatternControl " ;
   // formerKeyMetro = '*';
     
 //  formerKeyMetro = '#';  // can't add phasee
    print (" keyMode ",  keyMode, " formerKeyMetro ", formerKeyMetro );
    }

   if (moveKeys[8]==true && moveKeys[11]==true){ // ALT & f
   // keyMode = " methodAbleton " ;
    keyMode = " trigEventWithAbletonSignal " ;
    formerKeyMetro = '*';
  }

   if (moveKeys[8]==true && moveKeys[12]==true){ // ALT & v
    keyMode = " trigEventWithAbletonSignal " ;
  //  formerKeyMetro = '*';
  }
    
   if (key == '%' ){ 
    keyMode = " phasePattern " ;
   
    
  // formerKeyMetro = '*';
    print (" keyMode ",  keyMode, " formerKeyMetro ", formerKeyMetro );
    }
    
        if (key == 'ù' ){
    keyMode = " abletonPattern " ;
    abletonPattern();
   
    
   formerKeyMetro = '*';
    print (" keyMode ",  keyMode, " formerKeyMetro ", formerKeyMetro );
    }
    
  
   if (keyMode == " followDistribueAddLfoPatternControl " ){ //moveKeys[8]==true && // CONTROL 
   // if (formerFormerKey!='#'){
     /*
     if (Key!='#'){
    controlTrigLfoPattern = millis();
  
     }
       */
 //  keyMode = " followDistribueAddLfoPatternControl " ;
    
  // formerKeyMetro = '';
    }
    
  }

  