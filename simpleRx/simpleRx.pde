#include <XBee.h>

#define xb1High 0x0013A200
#define xb1Low 0x40492A47

#define xb2High 0x0013A200
#define xb2Low 0x40492704

#define xb3High 0x0013A200
#define xb3Low 0x406938DC

#define xbBroadcastHigh 0x00000000
#define xbBroadcastLow 0x0000FFFF

const int pinLED = 13;
const int pinBUTTON = 2;
XBee xbee = XBee();
Rx64Response rx64 = Rx64Response();
uint8_t* data;
uint8_t offset;

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
        data[] = rx64.getData();
        offset = rx64.getDataOffset();
        int arrayLength = rx64.getDataLength(); 
        for (int i = 0 - offset; i < arrayLength; i++){
            Serial.print(data[i]);
        }
        blinkLED(50);
    }
}
