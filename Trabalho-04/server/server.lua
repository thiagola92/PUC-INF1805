socket = require("socket")
local mqtt = require("mqtt_library")
local server_callback = require("server_callback")

local function new(server_id)
  server_id = server_id or 0
  local mqtt_client = mqtt.client.create("test.mosquitto.org", 1883, server_callback)

  mqtt_client:connect("lages_server_" .. server_id)
  mqtt_client:subscribe({"lages_new_player_" .. server_id})

  local function handler()
    mqtt_client:handler()
  end

  local function publish(topic, message)
    topic = topic .. server_id
    mqtt_client:publish(topic, message)
  end

  return {
    handler = handler,
    publish = publish,
  }
end

return {
  new = new
}
