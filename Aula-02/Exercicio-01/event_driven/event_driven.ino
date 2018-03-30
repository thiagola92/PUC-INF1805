#include "event_driven.h"
#include "app.h"
#include "pindefs.h"

#define PRESSED_DOWN 0
#define BUTTONS 3

unsigned long time_waited;
int buttons_listening[BUTTONS];
boolean is_button_pressed[BUTTONS];

void button_listen(int pin)
{
  for(int i = 0; i < BUTTONS; ++i)
  {
    if(buttons_listening[i] == -1)
    {
      buttons_listening[i] = pin;
      pinMode(pin, INPUT_PULLUP);
      return;
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
  initialize_buttons();
  
  appint();
}

void loop()
{
  check_buttons();
  check_timer();
}

void initialize_buttons()
{
  for(int i = 0; i < BUTTONS; ++i)
  {
    buttons_listening[i] = -1;
    is_button_pressed[i] = false;
  }
}

void check_buttons()
{
  for(int i = 0; i < BUTTONS; ++i)
    if(buttons_listening[i] != -1)
      check_button(i);
}

void check_button(int button_id)
{
  int button = buttons_listening[button_id];
  int button_val = digitalRead(button);
  
  if(is_button_changed(button_id, button_val) == true)
    button_changed(button, button_val);
}

boolean is_button_changed(int button_id, int button_val)
{
  if(button_val == PRESSED_DOWN && is_button_pressed[button_id] == false ||
    button_val == !PRESSED_DOWN && is_button_pressed[button_id] == true)
  {
    is_button_pressed[button_id] = !is_button_pressed[button_id];
    return true;
  }
  
  return false;
}

void check_timer()
{
  if(time_waited != 0)
  {
    if(millis() >= time_waited)
    {
      time_waited = 0;
      timer_expired();
    }
  }
}
