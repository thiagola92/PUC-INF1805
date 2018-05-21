-- Change "YOUR_KEY" to your key from Google API
-- You may have to register to gain acess to the key:
-- https://developers.google.com/maps/documentation/geolocation/intro
url = 'https://www.googleapis.com/geolocation/v1/geolocate?key=YOUR_KEY'
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

-- This callback is called when you receive or not data
-- The first argument is http status code, you probably knows them by:
-- 200: OK
-- 404: Not found
-- ...
-- in this case -1 means error
-- The second argument is the data received, in this example should be
-- the calculate coordinations using the wifi list in the json
function callback(code, data)
  print("callback(" .. code .. ", " .. data .. ")")
end

-- Send a post request, for this you need to say
-- url to receive the post
-- content_type is the header, this can be null
-- json is the body, don't have to be json format
-- the callback function that will be called after the post
http.post(url, content_type, json, callback)
