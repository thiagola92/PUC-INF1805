function client_callback(topic, message)
  local new_player = "lages_new_player_" .. client.get_server_id()

  if(topic == new_player) then
    print("client >> server registrou você")
  else
    print("client >> null")
  end
end

return client_callback
