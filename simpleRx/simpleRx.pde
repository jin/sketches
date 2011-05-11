#include <XBee.h>

const int pinLED = 13;
const int pinBUTTON = 2;
XBee xbee = XBee();
Rx64Response rx64 = Rx64Response();
uint8_t* data;

void blinkLED(int interval){
    digitalWrite(pinLED, HIGH);
    delay(interval);
    digitalWrite(pinLED, LOW);
}


void setup(){
    pinMode(pinLED, OUTPUT);
    pinMode(pinBUTTON, INPUT);
    Serial.begin(9600);
    xbee.begin(9600);
}


void loop(){
    xbee.readPacket();
    if (xbee.getResponse().isAvailable()){
        xbee.getResponse().getRx64Response(rx64);
        data = rx64.getData();
        int arrayLength = rx64.getDataLength(); 
        for (int i = 0; i < arrayLength; i++){
            Serial.print(data[i]);
        }
        blinkLED(50);
    }
}
