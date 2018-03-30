#include "buzzer.h"

#define BUZZER_DIO 3

#define OFF HIGH
#define ON LOW

#define SCHEDULES_SIZE 10
#define NO_SCHEDULE -1

boolean buzzerState = OFF;
unsigned int lastTimeChanged = millis();

unsigned int schedule[SCHEDULES_SIZE];
int scheduleNow = 0;

void buzzerSetup()
{
  pinMode(BUZZER_DIO, OUTPUT);
  digitalWrite(BUZZER_DIO, OFF);
  
  cleanSchedule();
}

void cleanSchedule()
{
  for(int i = 0; i < SCHEDULES_SIZE; i++) 
    schedule[i] = NO_SCHEDULE;
}

void playSchedule()
{
  if(scheduleNow >= SCHEDULES_SIZE || schedule[scheduleNow] == NO_SCHEDULE)
    scheduleNow = 0;

  if(schedule[scheduleNow] != NO_SCHEDULE)
    buzzerChangeAfter(!buzzerState, schedule[scheduleNow]);
}

void addSchedule(int pos_schedule, int ms)
{
  schedule[pos_schedule] = ms;
}

void buzzerChangeAfter(boolean state, int ms)
{
  if(buzzerState == state)
    return;

  if(millis() >= lastTimeChanged + ms)
  {
    digitalWrite(BUZZER_DIO, state);
    lastTimeChanged = millis();
    buzzerState = !buzzerState;
    scheduleNow++;
  }
}

