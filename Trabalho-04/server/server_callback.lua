function server_callback(topic, message)
  local new_player = "lages_new_player_" .. game_server.get_id()

  if(topic == new_player) then
    print("server >> recebeu novo jogador")
    game.add_player(message)
  else
    print("server >> recebeu atualizacao do jogador")
  end
end

return server_callback
