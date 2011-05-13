#include <XBee.h>

#define xb1High 0x0013A200
#define xb1Low 0x40492A47

#define xb2High 0x0013A200
#define xb2Low 0x40492704

#define xb3High 0x0013A200
#define xb3Low 0x406938DC

#define xbBroadcastHigh 0x00000000
#define xbBroadcastLow 0x0000FFFF

const uint8_t pinLED = 13;
const uint8_t pinBUTTON = 2;
uint8_t buttonState = 0;
XBee xbee = XBee();
uint8_t seqNum = 0;
XBeeAddress64 addr64 = XBeeAddress64(xb1High, xb1Low);

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
    uint8_t pktPayload[] = {'H','e','l','l','o',' ','W','o','r','l','d','\n','\r'};
    Tx64Request txReq = Tx64Request(addr64, pktPayload, sizeof(pktPayload));
    xbee.send(txReq);
    blinkLED(1);
    seqNum++;
    delay(50);
}
