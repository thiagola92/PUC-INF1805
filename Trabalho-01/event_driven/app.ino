#include "event_driven.h"
#include "display.h"
#include "buzzer.h"
#include "clock.h"
#include "pindefs.h"

// Com o SHIELD fica invertido
#define OFF HIGH
#define ON LOW

#define NORMAL_MODE 0
#define ALARM_MODE 1

int mode = NORMAL_MODE;
Clock normalClock;

void appint()
{
  setupBuzzer();
  setupDisplay();
  
  timer_set(0);
  
  normalClock.setHour(23);
  normalClock.setMinute(59);

  button_listen(KEY1);
  button_listen(KEY2);
  
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);
  pinMode(LED4, OUTPUT);

  digitalWrite(LED1, OFF);
  digitalWrite(LED2, OFF);
  digitalWrite(LED3, OFF);
  digitalWrite(LED4, OFF);
}

void button_changed(int p, int v)
{
  if(mode == NORMAL_MODE)
    normalMode(p, v);
  else if(mode == ALARM_MODE)
    alarmMode(p, v);
}

void timer_expired()
{
  timer_set(0);
  
  normalClock.updateClock();
  normalClock.displayClock();
}

void normalMode(int p, int v)
{
  if(p == KEY1 && v == PRESSED_DOWN)
  {
    normalClock.setMinute(normalClock.getMinute() + 1);
  }
  else if(p == KEY2 && v == PRESSED_DOWN)
  {
    normalClock.setMinute(normalClock.getMinute() - 1);
  }
}

void alarmMode(int p, int v)
{
  if(p == KEY1 && v == PRESSED_DOWN)
  {
    
  }
}

