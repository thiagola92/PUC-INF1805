#include "display.h"

Clock::Clock()
{
  hour = 0;
  minute = 0;
  millisecond = 0;
  
  lastUpdate = 0;
}

void Clock::setHour(int h)
{
  h = h % 24;
  if(h < 0)
    h += 24;

  hour = h;
}

void Clock::setMinute(int m)
{
  m = m % 60;
  if(m < 0)
    m += 60;

  minute = m;
}

int Clock::getHour()
{
  return hour;
}

int Clock::getMinute()
{
  return minute;
}

void Clock::updateClock()
{
  // Descobre quantos millisegundos fazem desde ultima chamada
  unsigned long now = millis();
  millisecond = millisecond + (now - lastUpdate);
  lastUpdate = now;

  // Descobre quantos minutos fazem desde ultima chamada e salva o resto dos millisegundos
  int m = millisecond / 60000;
  millisecond = millisecond - (m * 60000);

  // Define as horas
  int h = (minute + m) / 60;
  hour = (hour + h) % 24;
  
  // Define os minutos
  minute = (minute + m) % 60;
}

void Clock::displayClock()
{
  writeNumberToSegment(0, hour / 10);
  writeNumberToSegment(1, hour % 10);
  writeNumberToSegment(2, minute / 10);
  writeNumberToSegment(3, minute % 10);
  cleanDisplay();
}

long Clock::differenceBetween(Clock c)
{
  long diffH = c.getHour() - hour;
  if(diffH < 0)
    diffH = 24 + diffH;

  long diffM = c.getMinute() - minute;
  if(diffM < 0)
    diffM = 60 + diffM;
  
  diffH = diffH * 60 * 60 * 1000;
  diffM = diffM * 60 * 1000;

  long diff = -(long)millisecond;
  diff = diff + diffH + diffM;
  
  return diff;
}

