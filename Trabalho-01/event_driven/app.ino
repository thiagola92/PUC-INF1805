#include "event_driven.h"
#include "display.h"
#include "buzzer.h"
#include "clock.h"
#include "pindefs.h"

// Com o SHIELD fica invertido
#define OFF HIGH
#define ON LOW

#define IS_NORMAL_MODE mode == NORMAL_MODE || mode == NORMAL_MODE_HOUR || mode == NORMAL_MODE_MINUTE
#define IS_ALARM_MODE mode == ALARM_MODE || mode == ALARM_MODE_HOUR || mode == ALARM_MODE_MINUTE
#define IS_KEY3_PRESSED is_button_pressed[2]

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

void appint()
{
  setupBuzzer();
  setupDisplay();
  
  timer_set(0);
  
  normalClock.setHour(23);
  normalClock.setMinute(59);

  alarmClock.setHour(23);
  alarmClock.setMinute(59);

  setupArduino();
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

void button_changed(int p, int v)
{
  if(IS_NORMAL_MODE)
    normalMode(p, v);
  else if(IS_ALARM_MODE)
    alarmMode(p, v);
}

void timer_expired()
{
  timer_set(0);

  if (IS_NORMAL_MODE)
  {
    normalClock.updateClock();
    normalClock.displayClock();
  }
  else if (IS_ALARM_MODE)
  {
    alarmClock.displayClock();
  }
}

void normalMode(int p, int v)
{
  if(p == KEY1 && v == PRESSED_DOWN)
  {
    if (IS_KEY3_PRESSED)
      mode = NORMAL_MODE_HOUR;
    else if (mode == NORMAL_MODE_MINUTE)
      normalClock.setMinute(normalClock.getMinute() + 1);
    else if (mode == NORMAL_MODE_HOUR)
      normalClock.setHour(normalClock.getHour() + 1);
  }
  else if(p == KEY2 && v == PRESSED_DOWN)
  {
    if (IS_KEY3_PRESSED)
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
    if (IS_KEY3_PRESSED)
      mode = ALARM_MODE_HOUR;
    else if (mode == ALARM_MODE_MINUTE)
      alarmClock.setMinute(alarmClock.getMinute() + 1);
    else if (mode == ALARM_MODE_HOUR)
      alarmClock.setHour(alarmClock.getHour() + 1);
  }
  else if(p == KEY2 && v == PRESSED_DOWN)
  {
    if (IS_KEY3_PRESSED)
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

