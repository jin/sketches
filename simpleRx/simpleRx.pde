#include <XBee.h>

const int pinLED = 13;
const int pinBUTTON = 2;
XBee xbee = XBee();
XBeeResponse response = XBeeResponse();
Rx64Response rx64 = Rx64Response();

void setup(){
    pinMode(pinLED, OUTPUT);
    pinMode(pinBUTTON, INPUT);
    xbee.begin(9600);
}

void loop(){
    xbee.readPacket();
    if (xbee.getResponse().isAvailable()){
        xbee.getResponse().getRx64Response(rx64);
        digitalWrite(pinLED, HIGH);
        delay(100);
        digitalWrite(pinLED,LOW);
    }
}
