-- For more help about the topic: http://nodemcu.readthedocs.io/en/master/en/modules/mqtt/

local client = mqtt.Client("thiagola92", 120)

-- The function that will be called when you successfully subscribe to a topic
function subscribe_callback(client)
  print("subscribe_callback")
end

-- The function that will be called when you receive a
-- PUBACK (public acknowledgement) from the server
-- Read QoS level 1 for more info about this
function publish_callback(client)
  print("publish_callback")
end

function connected_callback (client)
  print("connected_callback")

  -- When publishing to a topic, you need to say
  -- the topic to publish, a message to publish, QoS level, retain flag,
  -- publish callback
  -- QoS level is how much sure you want to be that your message got to the
  -- receiver (level 0, 1 or 2): https://www.hivemq.com/blog/mqtt-essentials-part-6-mqtt-quality-of-service-levels
  -- Retain flag i don't know
  -- Last, function to be called when you receive a PUBACK
  -- Note: you don't always need to respond to a PUBACK so remember that is optional
  client:publish("topic","hello word",0,0, publish_callback)

  -- Now you are going to see 3 ways of subscribe (actually 2)
  -- Single subscribe and Multi subscribe

  -- To single subscribe you just need to say
  -- The topic which you want to listen, QoS level, subscribe callback
  -- Note: subscribe callback is only called when you subscribe! Not every message
  client:subscribe("topic", 0, subscribe_callback)

  -- To multi subscribe you need to pass
  -- A table, subscribe callback
  -- This table must have the key as topic and value as QoS level
  -- {
  --    topic = QoS level
  -- }
  -- Note: subscribe callback is only called when you subscribe! Not every message
  client:subscribe({topic1=0, topic2=0, topic3=1, topic4=2}, subscribe_callback)

  -- I created this example because i didn't know this way of declaring key
  -- and using this way you can use space like you would when single subscribe
  client:subscribe({["topic 5"]=0, ["topic 6"]=1}, subscribe_callback)
end

function failed_callback(client, reason)
  print("failed_callback(" .. reason .. ")")
end

client:connect("test.mosquitto.org", 1883, 0, connected_callback, failed_callback)
