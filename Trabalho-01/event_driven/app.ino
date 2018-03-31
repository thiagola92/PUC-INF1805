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
  
  setHour(23);
  setMinute(59);
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

