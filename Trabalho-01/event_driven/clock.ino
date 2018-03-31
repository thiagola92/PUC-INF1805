#include "display.h"

int hour = 0;
int minute = 0;
unsigned long millisecond = 0;

unsigned long lastUpdate = 0;

void setHour(int h)
{
  hour = h % 24;
}

void setMinute(int m)
{
  minute = m % 60;

  setHour(hour + m/60);
}

void updateClock()
{
  unsigned long now = millis();
  millisecond = millisecond + (now - lastUpdate);
  lastUpdate = now;
  
  int m = millisecond / 60000;
  millisecond = millisecond - (m * 60000);
  
  setMinute(minute + m);
  
  Serial.print(hour);
  Serial.print(":");
  Serial.print(minute);
  Serial.print(":");
  Serial.println(millisecond);
}

void displayClock()
{
  writeNumberToSegment(0, hour / 10);
  writeNumberToSegment(1, hour % 10);
  writeNumberToSegment(2, minute / 10);
  writeNumberToSegment(3, minute % 10);
  cleanDisplay();
}

