-- For more help about the topic: http://nodemcu.readthedocs.io/en/master/en/modules/mqtt/

local client = mqtt.Client("thiagola92", 120)

-- Everytime the client receive one message, it will call this function
-- The function receive the client that receive the message
-- The topic from where is the message
-- The message
function message_callback(client, topic, message)
  print("message_callback(" .. topic .. ", " .. message .. ")")
end

function subscribe_callback(client)
  print("subscribe_callback")

  -- Set a callback function for an event in this client
  -- First argument is the name of the event, it can be message/connect/offline
  -- You can read the function as "on message"/"on connect"/"on offline"
  -- The second argument is the function to be called when the event happens.
  -- If your event is connect/offline, the function will receive 1 argument
  -- client
  -- Else if your event is message, the function will receive 3 arguments
  -- client, topic, message
  client:on("message", message_callback)
end

function publish_callback(client)
  print("publish_callback")
end

function connected_callback (client)
  print("connected_callback")

  client:publish("topic","hello word",0,0, publish_callback)
  client:subscribe("topic", 0, subscribe_callback)
end

function failed_callback(client, reason)
  print("failed_callback(" .. reason .. ")")
end

client:connect("test.mosquitto.org", 1883, 0, connected_callback, failed_callback)
