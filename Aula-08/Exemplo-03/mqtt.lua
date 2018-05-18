local client = mqtt.Client("thiagola92", 120)

function connected_callback (client)
  print("connected_callback")
end

function failed_callback(client, reason)
  print("failed_callback(" .. reason .. ")")
end

client:connect("test.mosquitto.org", 1883, 0, connected_callback, failed_callback)
