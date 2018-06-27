socket = require("socket")
local mqtt = require("mqtt_library")

function callback(topic, message)
  print(message)
end

function love.load()
  mqtt_client = mqtt.client.create("test.mosquitto.org", 1883, callback)
  mqtt_client:connect("lages")
  --mqtt_client:subscribe({"lages_game_new_player"})
end

function love.draw()

end

function love.update(dt)
  --mqtt_client:handler()
end

function love.keypressed(key)
  print(key)
  --mqtt_client:publish("lages_game_new_player", key)
end
