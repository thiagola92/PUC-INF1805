function get_wifi_info(name, info)
  local string_info = "{"

  local _, s, m, c = string.match(info, ".*(%d+),([%-%d]+),([%w:]+),(%d+).*")

  string_info = string_info .. "\"macAddress\": \"" .. m .. "\","
  string_info = string_info .. "\"signalStrength\": " .. s .. ","
  string_info = string_info .. "\"channel\": "  .. c

  string_info = string_info .. "},\n"
  return string_info
end

function table_to_json(wifi_table)
  local json_array = "[[\n {\n \"wifiAccessPoints\": [ \n"

  for k,v in pairs(wifi_table) do
    print(k, v)
    json_array = json_array .. get_wifi_info(k, v)
  end

  json_array = json_array .. "]\n }\n ]]"
  print(json_array)
end

wifi.sta.getap(table_to_json)
