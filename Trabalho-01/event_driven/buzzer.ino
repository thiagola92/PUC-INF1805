#define BUZZER_DIO 3

#define OFF HIGH
#define ON LOW

#define SCHEDULES_SIZE 100
#define NO_SCHEDULE -1

boolean buzzerState = OFF;
unsigned long lastTimeChanged = millis();

unsigned long schedule[SCHEDULES_SIZE];
int scheduleNow = 0;

void setupBuzzer()
{
  pinMode(BUZZER_DIO, OUTPUT);
  digitalWrite(BUZZER_DIO, OFF);
  
  cleanSchedule();
}

void cleanSchedule()
{
  for(int i = 0; i < SCHEDULES_SIZE; i++) 
    schedule[i] = NO_SCHEDULE;

  resetSchedule();
}

void playSchedule()
{
  if(scheduleNow >= SCHEDULES_SIZE || schedule[scheduleNow] == NO_SCHEDULE)
    scheduleNow = 0;

  if(schedule[scheduleNow] != NO_SCHEDULE)
    changeBuzzerAfter(!buzzerState, schedule[scheduleNow]);
}

void addSchedule(int pos_schedule, unsigned long ms)
{
  schedule[pos_schedule] = ms;
}

void resetSchedule()
{
  scheduleNow = 0;
}

void changeBuzzerAfter(boolean state, unsigned long ms)
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

