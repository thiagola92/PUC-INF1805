socket = require("socket")
local mqtt = require("mqtt_library")

function mqttcb(topic, message)
   print("Received from topic: " .. topic .. " - message:" .. message)
end

function love.keypressed(key)
  mqtt_client:publish("apertou-tecla", key)
end

function love.load()
  mqtt_client = mqtt.client.create("test.mosquitto.org", 1883, mqttcb)
  mqtt_client:connect("cliente love 1")
  mqtt_client:subscribe({"apertou-tecla"})
end

function love.draw()
end

function love.update(dt)
  mqtt_client:handler()
end
