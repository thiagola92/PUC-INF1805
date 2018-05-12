socket = require("socket")
local mqtt = require("mqtt_library")

-- Every time the client receive a message from something that he subscribed,
-- he will save in one list the topic and message that received.
-- When you call the handler, it will call your "callback function"
-- for each of topic and message saved on the list.
function callback(topic, message)
   print("callback(" .. topic .. ", " .. message .. ")")
end

function love.load()
  -- When you create the client you need to say the
  -- hostname, port, callback function
  -- We are using the test server from mosquitto.org in port 1883
  -- The third parameter is the name of your callback function,
  -- for this example i called "callback"
  -- Note: you just created the client, you didn't talk to the server
  mqtt_client = mqtt.client.create("test.mosquitto.org", 1883, callback)

  -- You are passing to the server who are you, choose a string to use as
  -- identifier/username/login/...
  -- something unique for your client in this server
  -- If someone connect to the same server as you with the same  identifier
  -- you MAY have problems...
  mqtt_client:connect("thiagola92")

  -- This is where you subscribe for topics,
  -- similar to youtube subscribe system to you channel,
  -- you will receive every message from the topic you are subscribe.
  -- You can subscribe to more than one,
  -- each string, in this table, is a topic to subscribe.
  -- You don't have to subscribe to everything now, you can call this function
  -- as many times as you want, it will add the topics to your subscribe list
  mqtt_client:subscribe({"apertou-tecla"})
end

function love.draw()
end

function love.update(dt)
  -- The handler function will call every [topic, message] that you received
  -- to your callback function, if you don't call the handler,
  -- you will never read the input received from server.
  mqtt_client:handler()
end

function love.keypressed(key)
  -- You tell the server the topic/channel where you want to send the message
  -- and the message that you want to send,
  -- the server will send to everyone subscribed to this topic/channel.
  mqtt_client:publish("apertou-tecla", key)
end
