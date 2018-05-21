
geocode_url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=%d,%d&key=%s'
key = "KEY"
latitude = -21
longitude = -44

url = string.format(geocode_url, latitude, longitude, key)

function callback(code, data)
  print("callback")
  print(code, data)
end

http.post(url, nil, "", callback)
