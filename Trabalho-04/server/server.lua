socket = require("socket")
local mqtt = require("mqtt_library")
local server_callback = require("server_callback")

local function new(server_id)
  local mqtt_client = mqtt.client.create("test.mosquitto.org", 1883, server_callback)
  
  server_id = server_id or 0
  mqtt_client:connect("lages_server_" .. server_id)
  mqtt_client:subscribe({"lages_new_player_" .. server_id})

  function get_id()
    return server_id
  end

  local function handler()
    mqtt_client:handler()
  end

  local function publish(topic, message)
    mqtt_client:publish(topic, message)
  end

  return {
    get_id = get_id,
    handler = handler,
    publish = publish,
  }
end

return new
