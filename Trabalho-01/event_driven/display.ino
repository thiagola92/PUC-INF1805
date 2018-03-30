#include "display.h"

#define LATCH_DIO 4
#define CLK_DIO 7
#define DATA_DIO 8

const byte SEGMENT_MAP[] = {0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0X80,0X90};

const byte SEGMENT_SELECT[] = {1, 2, 4, 8};

void displaySetup ()
{
  pinMode(LATCH_DIO,OUTPUT);
  pinMode(CLK_DIO,OUTPUT);
  pinMode(DATA_DIO,OUTPUT); 
}

void writeNumberToSegment(byte segment, byte value)
{
  digitalWrite(LATCH_DIO,LOW); 
  shiftOut(DATA_DIO, CLK_DIO, MSBFIRST, SEGMENT_MAP[value]);
  shiftOut(DATA_DIO, CLK_DIO, MSBFIRST, SEGMENT_SELECT[segment] );
  digitalWrite(LATCH_DIO,HIGH);    
}
