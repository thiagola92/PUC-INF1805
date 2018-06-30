socket = require("socket")
local mqtt = require("mqtt_library")
local client_callback = require("client_callback")

local function new(client_id, server_id)
  local mqtt_client = mqtt.client.create("test.mosquitto.org", 1883, client_callback)

  client_id = client_id or 0
  server_id = server_id or 0
  print(client_id, server_id)
  mqtt_client:connect("lages_client_" .. client_id)
  mqtt_client:subscribe({"lages_new_player_" .. server_id})

  function get_id()
    return client_id
  end

  function get_server_id()
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
    get_server_id = get_server_id,
    handler = handler,
    publish = publish,
  }
end

return new
