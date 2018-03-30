#include "event_driven.h"
#include "display.h"
#include "buzzer.h"
#include "app.h"

#define OFF HIGH
#define ON LOW

void appint()
{
  buzzerSetup();
  displaySetup();
  
  addSchedule(0, 1000);
  addSchedule(1, 100);
  addSchedule(2, 2000);
  addSchedule(3, 100);
  addSchedule(4, 3000);
  addSchedule(5, 100);

  timer_set(1);
  Serial.println("appint");
}

void button_changed(int p, int v)
{
  
}

void timer_expired()
{
  Serial.println("timer_expired");
  playSchedule();
  timer_set(0);
}

