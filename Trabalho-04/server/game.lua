function new()
  local player_list = {}

  local function add_player(player_id)
    print("game >> adicionando novo jogador ao jogo", player_id)

    table.insert(player_list, player_id)
  end

  return {
    add_player = add_player,
  }
end

return new
