#include "app.h"

#define PRESSED_DOWN 0
#define BUTTONS 50

boolean is_waiting_timer;
unsigned long time_waited;

int buttons_listening[BUTTONS];
boolean button_pressed[BUTTONS];

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

boolean is_button_pressed(int pin)
{
  for(int i = 0; i < BUTTONS && buttons_listening[i] != -1; ++i)
  {
    if(buttons_listening[i] == pin)
      return button_pressed[i];
  }

  return false;
}

void timer_set(long ms)
{
  Serial.println(ms);
  is_waiting_timer = true;
  time_waited = millis() + ms;
}

void cancel_timer()
{
  is_waiting_timer = false;
}

//////////////////////////////////////////////////////////////////////

void setup()
{
  Serial.begin(9600);

  time_waited = 0;
  is_waiting_timer = false;
  initialize_buttons();
  
  appinit();
}

void initialize_buttons()
{
  for(int i = 0; i < BUTTONS; ++i)
  {
    buttons_listening[i] = -1;
    button_pressed[i] = false;
  }
}

void loop()
{
  always_loop();
  
  check_buttons();
  check_timer();
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
  if(button_val == PRESSED_DOWN && button_pressed[button_id] == false ||
    button_val == !PRESSED_DOWN && button_pressed[button_id] == true)
  {
    button_pressed[button_id] = !button_pressed[button_id];
    return true;
  }
  
  return false;
}

void check_timer()
{
  if(is_waiting_timer == true)
  {
    if(millis() >= time_waited)
    {
      is_waiting_timer = false;
      timer_expired();
    }
  }
}
