#include <XBee.h>

const int pinLED = 13;
const int pinBUTTON = 2;
int buttonState = 0;
XBee xbee = XBee();
uint8_t pktPayload[] = {'H','e','l','l','o',' ','W','o','r','l','d','\n','\r'};
//uint8_t pktPayload[] = {'H', 'e','l','l','o','\n','\r'};
XBeeAddress64 addr64 = XBeeAddress64(0x00000000, 0x0000FFFF);

void blinkLED(int interval){
    digitalWrite(pinLED, HIGH);
    delay(interval);
    digitalWrite(pinLED, LOW);
}

void setup(){
    pinMode(pinLED, OUTPUT);
    pinMode(pinBUTTON, INPUT);
    xbee.begin(9600);
    Serial.begin(9600);
}

void loop(){
    Tx64Request txReq = Tx64Request(addr64, pktPayload, sizeof(pktPayload));
    xbee.send(txReq);
    blinkLED(5);
    delay(1000);
}
