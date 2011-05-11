#include <XBee.h>

const int pinLED = 13;
const int pinBUTTON = 2;
XBee xbee = XBee();
XBeeResponse response = XBeeResponse();
Rx64Response rx64 = Rx64Response();

void blinkLED(int interval){
    digitalWrite(pinLED, HIGH);
    delay(interval);
    digitalWrite(pinLED, LOW);
}


void setup(){
    pinMode(pinLED, OUTPUT);
    pinMode(pinBUTTON, INPUT);
    xbee.begin(9600);
}

void loop(){
    xbee.readPacket();
    if (xbee.getResponse().isAvailable()){
        xbee.getResponse().getRx64Response(rx64);
        blinkLED(100);
    }
}
