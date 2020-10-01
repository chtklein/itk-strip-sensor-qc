#include <Wire.h>
#include "SHTSensor.h"

const int edgeSense = 2;          // Schmitt trigger input
const int ldr = 7;              // LDR input
const int ledPin =  13;           // Arduino built-in LED

// SHTSensor sht;
// To use a specific sensor instead of probing the bus use this command:
SHTSensor sht(SHTSensor::SHT3X);




//--------------------------------
//------------ Setup -------------
//--------------------------------

void setup() 
{
  Wire.begin();
  Serial.begin(9600);
  delay(1000); // let serial console settle

  sht.init();
  sht.setAccuracy(SHTSensor::SHT_ACCURACY_MEDIUM); // only supported by SHT3x
  
//  if (sht.readSample()) {
//      Serial.print("SHT:\n");
//      Serial.print("  RH: ");
//      Serial.print(sht.getHumidity(), 2);
//      Serial.print("\n");
//      Serial.print("  T:  ");
//      Serial.print(sht.getTemperature(), 2);
//      Serial.print("\n");
//  } else {
//      Serial.print("Error in readSample()\n");
//  }

  Serial.print("Moin, moin!");
  Serial.print("\n");
  Serial.flush();
  
  
}

//--------------------------------
//------------- Loop -------------
//--------------------------------

void loop() {
  // put your main code here, to run repeatedly:

  int cardState = digitalRead(edgeSense);
  int interlock = digitalRead(ldr);

  if (Serial.available() > 0) 
  {
    int inByte = Serial.read();

    if (inByte == 'a')
    {
      Serial.print(cardState);
      Serial.print("\n");
    }

    else if (inByte == 'b')
    {
      Serial.print(interlock);
      Serial.print("\n");
    }
    
    else if (inByte == 'c')
    {
      sht.readSample();
      Serial.print(sht.getTemperature(), 2);
      Serial.print(" ");
      Serial.print(sht.getHumidity(), 2);
      Serial.print("\n");
    }
    Serial.flush();
  }
  delay(100);

//  if (sht.readSample()) {
//      Serial.print("SHT:\n");
//      Serial.print("  RH: ");
//      Serial.print(sht.getHumidity(), 2);
//      Serial.print("\n");
//      Serial.print("  T:  ");
//      Serial.print(sht.getTemperature(), 2);
//      Serial.print("\n");
//  } else {
//      Serial.print("Error in readSample()\n");
//  }
//
//  delay(1000);
}
