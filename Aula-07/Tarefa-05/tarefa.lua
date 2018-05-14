pin_led_1 = 3
pin_led_2 = 6

pin_button_1 = 1
pin_button_2 = 2

interval_speed = 1000

timer = tmr.create()

gpio.mode(pin_led_1, gpio.OUTPUT)
gpio.mode(pin_led_2, gpio.OUTPUT)

gpio.mode(pin_button_1, gpio.INT, gpio.PULLUP)
gpio.mode(pin_button_2, gpio.INT, gpio.PULLUP)

gpio.write(pin_led_1, gpio.HIGH)
gpio.write(pin_led_2, gpio.LOW)

function change_led_speed(signal)
  local last_call = 0

  local function is_on_cooldown(now)
    if(now - last_call > 50000) then
      return false
    end

    return true
  end

  local function callback(level, when, eventcount)
    if(is_on_cooldown(tmr.now())) then
      return
    end

    if(signal > 0) then
      interval_speed = interval_speed * 2
    elseif(signal < 0) then
      interval_speed = interval_speed / 2
    end

    print("interval speed: ", interval_speed)
  end

  return callback
end

function change_leds_states()
  if(gpio.read(pin_led_1) == gpio.LOW) then
    gpio.write(pin_led_1, gpio.HIGH)
  else
    gpio.write(pin_led_1, gpio.LOW)
  end

  if(gpio.read(pin_led_2) == gpio.LOW) then
    gpio.write(pin_led_2, gpio.HIGH)
  else
    gpio.write(pin_led_2, gpio.LOW)
  end

  print("led state 1: ", gpio.read(pin_led_1))
  print("led state 2: ", gpio.read(pin_led_2))

  timer:alarm(interval_speed, tmr.ALARM_SINGLE, change_leds_states())
end

gpio.trig(pin_button_1, "down", change_led_speed(-1))
gpio.trig(pin_button_2, "down", change_led_speed(1))

timer:alarm(interval_speed, tmr.ALARM_SINGLE, change_leds_states())
