-- For more help about the topic: http://nodemcu.readthedocs.io/en/master/en/modules/mqtt/

local client = mqtt.Client("thiagola92", 120)

function subscribe_callback(client)
  print("subscribe_callback")
end

function publish_callback(client)
  print("publish_callback")
end

function connected_callback (client)
  print("connected_callback")

  client:publish("topic","hello word",0,0, publish_callback)
  
  client:subscribe("topic", 0, subscribe_callback)
  client:subscribe({topic1=0, topic2=0, topic3=1, topic4=2}, subscribe_callback)
  client:subscribe({["topic5"]=0, ["topic6"]=1}, subscribe_callback)
end

function failed_callback(client, reason)
  print("failed_callback(" .. reason .. ")")
end

client:connect("test.mosquitto.org", 1883, 0, connected_callback, failed_callback)
