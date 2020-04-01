// Arduino routine to read out the state of probe card edgesense and temperature

#include <Sensirion.h>

const int edgeSense = 2;          // Schmitt trigger input
const byte dataPin =  6;          // SHTxx serial data
const byte clockPin =  5;         // SHTxx serial clock
const int ldr = 7;              // LDR input
const int ledPin =  13;           // Arduino built-in LED
const unsigned long TRHSTEP   = 5000UL;   // Sensor query period
const unsigned long BLINKSTEP =  250UL;   // LED blink period

Sensirion tempSensor = Sensirion(dataPin, clockPin);

unsigned int rawData;
float temperature;
float humidity;
int ledState = LOW;
byte measActive = false;
byte measType = TEMP;
unsigned long trhMillis = 0;        // Time interval tracking


//--------------------------------
//------------ Setup -------------
//--------------------------------

void setup(void)
{
  Serial.begin(9600);
  pinMode(edgeSense, INPUT);
  pinMode(ldr, INPUT);
  pinMode(ledPin, OUTPUT);
  byte stat;
  byte error = 0;
  delay(5000);                  // Wait >= 5s before first cmd, before SHT output is 0
  Serial.print("Moin, moin!");
  Serial.print("\n");
  Serial.flush();
}


//--------------------------------
//------------- Loop -------------
//--------------------------------


void loop()
{
  int cardState = digitalRead(edgeSense);
  int interlock = digitalRead(ldr);
  //digitalWrite(ledPin, cardState);
  digitalWrite(ledPin, 1);

  // cardState = 1 -> no contact, cardState = 0 -> contact
  // interlock = 1 -> light, interlock = 0 -> dark

  //----- necessary for SHT readout -----
  unsigned long curMillis = millis();       // Get current time
  
  if (curMillis - trhMillis >= TRHSTEP)     // Time for new measurements?
  {
    measActive = true;
    measType = TEMP;
    tempSensor.meas(TEMP, &rawData, NONBLOCK);      // Start temp measurement
    trhMillis = curMillis;
  }
  
  if (measActive && tempSensor.measRdy())       // Check measurement status
  {
    if (measType == TEMP)
    {                     // Process temp or humi?
      measType = HUMI;
      temperature = tempSensor.calcTemp(rawData); // Convert raw sensor data
      tempSensor.meas(HUMI, &rawData, NONBLOCK);    // Start humi measurement
    }
    else
    {
      measActive = false;
      humidity = tempSensor.calcHumi(rawData, temperature); // Convert raw sensor data
    }
  }
  //------------------------------------


  
  
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
      Serial.print(temperature);
      Serial.print(" ");
      Serial.print(humidity);
      Serial.print("\n");
    }
    Serial.flush();
  }
  delay(100);
}
