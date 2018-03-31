#include "event_driven.h"
#include "display.h"
#include "buzzer.h"
#include "clock.h"
#include "pindefs.h"

// Com o SHIELD fica invertido
#define OFF HIGH
#define ON LOW

typedef enum
{
  NORMAL_MODE,
  NORMAL_MODE_MINUTE,
  NORMAL_MODE_HOUR,
  ALARM_MODE,
  ALARM_MODE_MINUTE,
  ALARM_MODE_HOUR
} Mode;

Mode mode = NORMAL_MODE;
Clock normalClock;
Clock alarmClock;
boolean alarmOn = false;

void appint()
{
  setupArduino();
  setupBuzzer();
  setupDisplay();
  
  normalClock.setHour(00);
  normalClock.setMinute(00);

  alarmClock.setHour(00);
  alarmClock.setMinute(01);
  
  addSchedule(0, 100);
  addSchedule(1, 1000);
}

void setupArduino()
{
  button_listen(KEY1);
  button_listen(KEY2);
  button_listen(KEY3);
  
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);
  pinMode(LED4, OUTPUT);

  digitalWrite(LED1, OFF);
  digitalWrite(LED2, OFF);
  digitalWrite(LED3, OFF);
  digitalWrite(LED4, OFF);
}

void always_loop()
{
  if (mode == NORMAL_MODE || mode == NORMAL_MODE_HOUR || mode == NORMAL_MODE_MINUTE)
  {
    normalClock.updateClock();
    normalClock.displayClock();
  }
  else if (mode == ALARM_MODE || mode == ALARM_MODE_HOUR || mode == ALARM_MODE_MINUTE)
  {
    alarmClock.displayClock();
  }
}

void button_changed(int p, int v)
{
  if(mode == NORMAL_MODE || mode == NORMAL_MODE_HOUR || mode == NORMAL_MODE_MINUTE)
    normalMode(p, v);
  else if(mode == ALARM_MODE || mode == ALARM_MODE_HOUR || mode == ALARM_MODE_MINUTE)
    alarmMode(p, v);
}

void timer_expired()
{
  playSchedule();
  timer_set(0);
}

void normalMode(int p, int v)
{
  if(p == KEY1 && v == PRESSED_DOWN)
  {
    if (is_button_pressed(KEY3))
      mode = NORMAL_MODE_HOUR;
    else if (mode == NORMAL_MODE_MINUTE)
      normalClock.setMinute(normalClock.getMinute() + 1);
    else if (mode == NORMAL_MODE_HOUR)
      normalClock.setHour(normalClock.getHour() + 1);
    else
      turnOnOffAlarm();
  }
  else if(p == KEY2 && v == PRESSED_DOWN)
  {
    if (is_button_pressed(KEY3))
      mode = NORMAL_MODE_MINUTE;
    else if (mode == NORMAL_MODE_MINUTE)
      normalClock.setMinute(normalClock.getMinute() - 1);
    else if (mode == NORMAL_MODE_HOUR)
      normalClock.setHour(normalClock.getHour() - 1);
  }
  else if(p == KEY3 && v == PRESSED_DOWN)
  {
    mode = ALARM_MODE;
  }
}

void alarmMode(int p, int v)
{
  if(p == KEY1 && v == PRESSED_DOWN)
  {
    if (is_button_pressed(KEY3))
      mode = ALARM_MODE_HOUR;
    else if (mode == ALARM_MODE_MINUTE)
      alarmClock.setMinute(alarmClock.getMinute() + 1);
    else if (mode == ALARM_MODE_HOUR)
      alarmClock.setHour(alarmClock.getHour() + 1);
  }
  else if(p == KEY2 && v == PRESSED_DOWN)
  {
    if (is_button_pressed(KEY3))
      mode = ALARM_MODE_MINUTE;
    else if (mode == ALARM_MODE_MINUTE)
      alarmClock.setMinute(alarmClock.getMinute() - 1);
    else if (mode == ALARM_MODE_HOUR)
      alarmClock.setHour(alarmClock.getHour() - 1);
  }
  else if(p == KEY3 && v == PRESSED_DOWN)
  {
    mode = NORMAL_MODE;
  }
}

void turnOnOffAlarm()
{
  if(alarmOn == true)
  {
    cancel_timer();
    digitalWrite(LED1, OFF);
    changeBuzzerAfter(OFF, 0);
  }
  else
  {
    long difference = normalClock.differenceBetween(alarmClock);
    timer_set(difference);
    digitalWrite(LED1, ON);
  }
  
  alarmOn = !alarmOn;
}

