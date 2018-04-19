require("socket")
local mqtt = require("mqtt_library")

test = "sem resposta"

function mqtt_callback(topic, message)
  print("mqtt_callback", topic, message)
end

function love.load()
  mqtt_client = mqtt.client.create("test.mosquitto.org", 1883, mqtt_callback)
  --mqtt_client:connect("thiagola92")
  --mqtt_client:subscribe({"key a"})
end

function love.draw()
  love.graphics.print(test)
end

function love.update()
  --mqtt_client:handler()
end
