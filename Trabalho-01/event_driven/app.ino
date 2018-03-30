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
}

void button_changed(int p, int v)
{
  
}

void timer_expired()
{
  
}

