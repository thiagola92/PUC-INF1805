-- Documentation http://nodemcu.readthedocs.io/en/master/
-- Most of this will be like arduino
-- I will coment when something is different

pinLed1 = 3
pinButton1 = 1

-- GPIO stands for General Purpose Input/Output
gpio.mode(pinLed1, gpio.OUTPUT)
gpio.write(pinLed1, gpio.LOW);
gpio.mode(pinButton1, gpio.INT, gpio.PULLUP)
-- gpio.INT (interrupt mode)
-- Same as gpio.input + set a callback to be executed every time a pin's value changes

function pinCallback(led)
  local ledstate = false

  return
  function (level, timestamp, eventcount)
    print(level, timestamp, eventcount)
    ledstate =  not ledstate
    if ledstate then 
      gpio.write(led, gpio.HIGH);
    else
      gpio.write(led, gpio.LOW);
    end
  end

end

gpio.trig(pinButton1, "down", pinCallback(pinLed1))
