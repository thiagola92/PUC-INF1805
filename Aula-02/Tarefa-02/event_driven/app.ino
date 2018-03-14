#include "event_driven.h"
#include "app.h"
#include "pindefs.h"

double blink_timer = 1000;
int led_state = 1;

long button1_time_pressed = -1;
long button2_time_pressed = -1;

void appint(void)
{
  button_listen(KEY1);
  button_listen(KEY2);
  button_listen(KEY3);

  pinMode(LED4, OUTPUT);

  timer_set(blink_timer);
}

void button_changed(int p, int v)
{
  Serial.println("button_changed");
  if(p == KEY1 && v == PRESSED_DOWN)
  {
    button1_time_pressed = millis();
    blink_timer /= 2;
  }
  else if (p == KEY2 && v == PRESSED_DOWN)
  {
    button2_time_pressed = millis();
    blink_timer *= 2;
  }

  if(buttons_pressed())
    while(1);
}

boolean buttons_pressed()
{
  if(buttons_pressed_before())
    return pressed_interval_inside(500);

  return false;
}

boolean buttons_pressed_before()
{
  if(button1_time_pressed != -1 && button2_time_pressed != -1)
    return true;
  return false;
}

boolean pressed_interval_inside(long max_interval)
{
  long interval = abs(button1_time_pressed - button2_time_pressed);
  Serial.println(interval);

  if(interval < max_interval)
    return true;
  return false;
}

void timer_expired(void)
{
  Serial.println("timer_expired");
  led_state = !led_state;
  digitalWrite(LED4, led_state);
  timer_set(blink_timer);
}
