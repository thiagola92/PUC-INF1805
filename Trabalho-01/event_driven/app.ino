#include "event_driven.h"
#include "display.h"
#include "buzzer.h"
#include "app.h"

#define OFF HIGH
#define ON LOW

void appint()
{
  setupBuzzer();
  setupDisplay();
  
  timer_set(0);
  
  setHour(1);
  setMinute(32);
}

void button_changed(int p, int v)
{
  
}

void timer_expired()
{
  timer_set(0);
  
  updateClock();
  displayClock();
}

