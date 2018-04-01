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

boolean isRecording = false;
unsigned long lastRecord = 0;
int lastRecordPosition = 0;

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

  digitalWrite(LED4, OFF);
  digitalWrite(LED3, OFF);
  digitalWrite(LED2, OFF);
  digitalWrite(LED1, OFF);
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
  if(p == KEY1 && v == PRESSED_DOWN)
    firstButton();
  else if(p == KEY2 && v == PRESSED_DOWN)
    secondButton();
  else if(p == KEY3 && v == PRESSED_DOWN)
    thirdButton();

  if(p == KEY1 && v != PRESSED_DOWN && mode == ALARM_MODE && isRecording == true)
    addRecording();
}

void timer_expired()
{
  playSchedule();
  timer_set(0);
}

void firstButton()
{  
  if (is_button_pressed(KEY3))
    firstAndThirdButtons();
  else if(mode == NORMAL_MODE)
    turnOnOffAlarm();
  else if (mode == NORMAL_MODE_MINUTE)
    normalClock.setMinute(normalClock.getMinute() + 1);
  else if (mode == NORMAL_MODE_HOUR)
    normalClock.setHour(normalClock.getHour() + 1);
  else if (mode == ALARM_MODE_MINUTE)
    alarmClock.setMinute(alarmClock.getMinute() + 1);
  else if (mode == ALARM_MODE_HOUR)
    alarmClock.setHour(alarmClock.getHour() + 1);
  else if (mode == ALARM_MODE && isRecording == true)
    addRecording();
}

void firstAndThirdButtons()
{
  if(mode == NORMAL_MODE || mode == NORMAL_MODE_HOUR || mode == NORMAL_MODE_MINUTE)
  {
    mode = NORMAL_MODE_HOUR;
    digitalWrite(LED3, ON);
  }
  else if(mode == ALARM_MODE || mode == ALARM_MODE_HOUR || mode == ALARM_MODE_MINUTE)
  {
    mode = ALARM_MODE_HOUR;
    digitalWrite(LED3, ON);
  }
}

void secondButton()
{
  if (is_button_pressed(KEY3))
    secondAndThirdButtons();
  else if (mode == NORMAL_MODE_MINUTE)
    normalClock.setMinute(normalClock.getMinute() - 1);
  else if (mode == NORMAL_MODE_HOUR)
    normalClock.setHour(normalClock.getHour() - 1);
  else if (mode == ALARM_MODE_MINUTE)
    alarmClock.setMinute(alarmClock.getMinute() - 1);
  else if (mode == ALARM_MODE_HOUR)
    alarmClock.setHour(alarmClock.getHour() - 1);
  else if (mode == ALARM_MODE)
    recording();
}

void secondAndThirdButtons()
{
  if(mode == NORMAL_MODE || mode == NORMAL_MODE_HOUR || mode == NORMAL_MODE_MINUTE)
  {
    mode = NORMAL_MODE_MINUTE;
    digitalWrite(LED2, ON);
  }
  else if(mode == ALARM_MODE || mode == ALARM_MODE_HOUR || mode == ALARM_MODE_MINUTE)
  {
    mode = ALARM_MODE_MINUTE;
    digitalWrite(LED2, ON);
  }
}

void thirdButton()
{
  stopRecording();
  
  if(mode == NORMAL_MODE || mode == NORMAL_MODE_HOUR || mode == NORMAL_MODE_MINUTE)
  {
    mode = ALARM_MODE;
    digitalWrite(LED4, ON);
    digitalWrite(LED3, OFF);
    digitalWrite(LED2, OFF);
  }
  else if(mode == ALARM_MODE || mode == ALARM_MODE_HOUR || mode == ALARM_MODE_MINUTE)
  {
    mode = NORMAL_MODE;
    digitalWrite(LED4, OFF);
    digitalWrite(LED3, OFF);
    digitalWrite(LED2, OFF);
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

void recording()
{
  if(isRecording == true)
    stopRecording();
  else
    startRecording();
}

void startRecording()
{
  Serial.println("startRecording");
  cleanSchedule();
  changeBuzzerAfter(OFF, 0);
  
  isRecording = true;
  lastRecord = millis();
  lastRecordPosition = 0;
}

void addRecording()
{
  Serial.println("addRecording");
  unsigned long m = millis();
  
  addSchedule(lastRecordPosition, m - lastRecord);
  lastRecordPosition++;
  lastRecord = m;
}

void stopRecording()
{
  Serial.println("stopRecording");
  resetSchedule();
  changeBuzzerAfter(OFF, 0);
  
  isRecording = false;
}

