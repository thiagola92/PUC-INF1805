function server_callback(topic, message)
  local new_player = "lages_new_player_" .. server.get_id()
  local _, movement_x = string.find(topic, "lages_movement_x_")
  local _, movement_y = string.find(topic, "lages_movement_y_")
  print(movement_x, movement_y)

  if(topic == new_player) then
    print("server >> recebeu novo jogador")

    local player_channels = {
      "lages_movement_x_" .. message,
      "lages_movement_y_" .. message,
    }

    print(player_channels[1], player_channels[2])

    server.mqtt:subscribe(player_channels)
    game.add_player(message)
  elseif(movement_x ~= nil) then
    local player_id = string.sub(topic, movement_x + 1)
    local player = game.get_player(player_id)
    if(player ~= nil) then
      player.update_x(message)
    end

    print("server >> recebeu atualizacao do X do jogador", player_id, message)
  elseif(movement_y ~= nil) then
    local player_id = string.sub(topic, movement_y + 1)
    local player = game.get_player(player_id)
    if(player ~= nil) then
      player.update_y(message)
    end

    print("server >> recebeu atualizacao do Y do jogador", player_id, message)
  end
end

return server_callback
