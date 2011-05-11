#include <XBee.h>

const int pinLED = 13;
XBee xbee = XBee();
XBeeAddress64 addr64 = XBeeAddress64(0x00000000, 0x0000FFFF);

void setup(){
    pinMode(pinLED, OUTPUT);
    pinMode(pinBUTTON, INPUT);
    xbee.begin(9600);
}

void loop(){
}
