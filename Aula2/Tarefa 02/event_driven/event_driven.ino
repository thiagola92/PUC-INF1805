#include "event_driven.h"
#include "app.h"
#include "pindefs.h"

#define BUTTONS_SIZE 3

static unsigned long time_waited;
static int buttons_listening[BUTTONS_SIZE];

void button_listen(int pin)
{
  for(int i = 0; i < BUTTONS_SIZE; ++i)
  {
    if(buttons_listening[i] == 0)
    {
      buttons_listening[i] = pin;
      pinMode(pin, INPUT_PULLUP);
    }
  }
}

void timer_set(int ms)
{
  time_waited = millis() + ms;
}

void setup()
{
  Serial.begin(9600);
  
  time_waited = 0;
  for(int i = 0; i < BUTTONS_SIZE; ++i)
    buttons_listening[i] = -1;
  
  appint();
}

void loop()
{
  check_buttons();
  
  check_time();
}

void check_buttons()
{
  for(int i = 0; i < BUTTONS_SIZE; ++i)
    if(buttons_listening[i] != -1)
      check_button(buttons_listening[i]);
}

void check_button(int button)
{
  int button_val = digitalRead(button);
  if(button_val)
    button_changed(button, button_val);
}

void check_time()
{
  if(time_waited != 0)
  {
    if(millis() >= time_waited)
      timer_expired();
  }
}
