
url = 'https://www.googleapis.com/geolocation/v1/geolocate?key=SUACHAVE'
content_type = 'Content-Type: application/json\r\n'
json = [[
{
  "wifiAccessPoints": [
    { "macAddress": "c8:4c:75:40:be:87",
      "signalStrength": -60,
      "channel": 8},
    { "macAddress": "02:15:99:d0:f2:cb",
      "signalStrength": -84,
      "channel": 11},
    { "macAddress": "f8:1a:67:cb:b1:9c",
      "signalStrength": -90,
      "channel": 11},
    { "macAddress": "d0:d0:fd:39:c3:eb",
      "signalStrength": -66,
      "channel": 9}
  ]
}
]]

function callback(code, data)
  print("callback")
  print(code, data)
end

http.post(url, content_type, json, callback)
