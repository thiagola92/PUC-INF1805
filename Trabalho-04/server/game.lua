local new_player = require("player")

function new()
  local player_list = {}

  local function add_player(player_id)
    print("game >> adicionando novo jogador ao jogo", player_id)

    local player = new_player(player_id)

    table.insert(player_list, player)
  end

  local function get_player(player_id)
  	for _, player in ipairs(player_list) do
  		if(player.get_id() == player_id) then
        return player
      end
  	end

    return nil
  end

  local function update()
  	for _, player in ipairs(player_list) do
  		player.update()
  	end
  end

  local function draw()
  	for _, player in ipairs(player_list) do
  		player.draw()
  	end
  end

  return {
    add_player = add_player,
    get_player = get_player,
    update = update,
    draw = draw,
  }
end

return new
