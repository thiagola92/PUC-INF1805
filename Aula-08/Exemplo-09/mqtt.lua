-- From example 03 until 08 none would work
-- because you didn't have internet so you were always receving
-- failed connect to server reason -3
-- On this example, this change because i used what we learned from
-- wifi.lua to connect to wifi before trying to connect (important order)

local client = mqtt.Client("thiagola92", 120)

function connected_callback (client)
  print("connected_callback")
end

function failed_callback(client, reason)
  print("failed_callback(" .. reason .. ")")
end

local function wifi_connected_callback(iptable)
  print("connection made")
  print("ip: " .. iptable.IP)

  client:connect("test.mosquitto.org", 1883, 0, connected_callback, failed_callback)
  print("Trying to connect to the server")
end

wificonf = {
  ssid = "XXXXXX",
  pwd = "XXXXXXX",
  got_ip_cb = wifi_connected_callback,
  save = false,
}

wifi.setmode(wifi.STATION)
wifi.sta.config(wificonf)
print("Trying to connect to the wifi")
