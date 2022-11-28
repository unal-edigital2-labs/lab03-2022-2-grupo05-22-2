#include <OneWire.h>
#include <DallasTemperature.h>

// Pin donde se conecta el bus 1-Wire
const int pinDatosDQ = 9;
#define sensorPower 7
#define sensorPin A0
#define salidalevel 10
float sensorValue;  //variable to store sensor value
// Value for storing water level
// Value for storing water level
int val = 0;
// Instancia a las clases OneWire y DallasTemperature
OneWire oneWireObjeto(pinDatosDQ);
DallasTemperature sensorDS18B20(&oneWireObjeto);

void setup() {
  // Set D7 as an OUTPUT
  pinMode(sensorPower, OUTPUT);
  pinMode(salidalevel,OUTPUT);  
  // Set to LOW so no power flows through the sensor
  digitalWrite(sensorPower, LOW);
  // Iniciamos la comunicación serie
  Serial.begin(9600);
  // Iniciamos el bus 1-Wire
  sensorDS18B20.begin();
}

void loop() {
  delay(1000);
  
  int level = readSensor();
	
	Serial.print("Water level: ");
	Serial.println(level);
	delay(1000);

  if (level>200){

     Serial.println("1");
     digitalWrite(salidalevel, LOW);
  }
  else {

   Serial.println("0");
   digitalWrite(salidalevel, HIGH);
  }
}

int readSensor() {
	digitalWrite(sensorPower, HIGH);	// Turn the sensor ON
	delay(10);							// wait 10 milliseconds
	val = analogRead(sensorPin);		// Read the analog value form sensor
	digitalWrite(sensorPower, LOW);		// Turn the sensor OFF
	return val;							// send current reading
}



