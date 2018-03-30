#include "event_driven.h"
#include "app.h"
#include "pindefs.h"

double blink_timer = 1000;
int led_state = 1;

void appint(void)
{
  button_listen(KEY1);

  pinMode(LED4, OUTPUT);

  timer_set(blink_timer);
}

void button_changed(int p, int v)
{
  Serial.println("button_changed");
  if(p == KEY1 && v == PRESSED_DOWN)
  {
    digitalWrite(LED4, HIGH);
    while(1);
  }
}

void timer_expired(void)
{
  Serial.println("timer_expired");
  led_state = !led_state;
  digitalWrite(LED4, led_state);
  timer_set(blink_timer);
}
