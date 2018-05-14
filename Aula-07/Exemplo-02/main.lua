-- Documentation: http://nodemcu.readthedocs.io/en/master/
-- Tutorial: https://github.com/hackhitchin/esp8266-co-uk/blob/master/tutorials/introduction-to-gpio-api.md
-- Most of this will be like arduino
-- I will coment when something is different

pinLed1 = 3
pinButton1 = 1

-- GPIO stands for General Purpose Input/Output
gpio.mode(pinLed1, gpio.OUTPUT)
gpio.write(pinLed1, gpio.LOW);
gpio.mode(pinButton1, gpio.INT, gpio.PULLUP)
-- gpio.INT (interrupt mode), everytime it change will call a callback function

local ledstate = false

local function callback(level, timestamp, eventcount)
  print(level, timestamp, eventcount)

  ledstate = not ledstate
  if(ledstate == true) then
    gpio.write(pinLed1, gpio.HIGH)
  else
    gpio.write(pinLed1, gpio.LOW)
  end
end

gpio.trig(pinButton1, "down", callback)
-- trig == trigger
-- Will watch the pin
-- And when it change to the state X
-- It will call the callback function
-- NOTE: The callback function can receives
-- 3 parameters => level, timestamp, eventcount
