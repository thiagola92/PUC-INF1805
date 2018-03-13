#include "event_driven.h"
#include "app.h"
#include "pindefs.h"

void appint(void)
{
  button_listen(KEY1);
  button_listen(KEY2);
  button_listen(KEY3);
}

void button_changed(int p, int v)
{
  
}

void timer_expired(void)
{
  
}
