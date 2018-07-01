function server_callback(topic, message)
  local new_player = "lages_new_player_" .. server.get_id()

  if(topic == new_player) then
    print("server >> recebeu novo jogador")

    local player_channels = {
      "lages_movement_x_" .. message,
      "lages_movement_y_" .. message,
    }

    print(player_channels[1], player_channels[2])

    server.mqtt:subscribe(player_channels)
    game.add_player(message)
  else
    print("server >> recebeu atualizacao do jogador")
  end
end

return server_callback
