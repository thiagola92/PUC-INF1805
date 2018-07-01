socket = require("socket")
local mqtt = require("mqtt_library")
local client_callback = require("client_callback")

local function new(client_id, server_id)
  local mqtt_client = mqtt.client.create("test.mosquitto.org", 1883, client_callback)

  client_id = client_id or love.math.random()
  server_id = server_id or 0
  mqtt_client:connect("lages_client_" .. client_id)
  mqtt_client:publish("lages_new_player_" .. server_id, client_id)

  function get_id()
    return client_id
  end

  function get_server_id()
    return server_id
  end

  return {
    get_id = get_id,
    get_server_id = get_server_id,
    mqtt = mqtt_client,
  }
end

return new
