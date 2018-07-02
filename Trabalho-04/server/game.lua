local new_player = require("player")
local new_obstacle_handler = require("obstacle_handler")
local collision = require("collision")

function new()
  local player_list = {}
  local obstacle_handler = new_obstacle_handler()

  local function get_player(player_id)
  	for _, player in ipairs(player_list) do
  		if(player.get_id() == player_id) then
        return player
      end
  	end

    return nil
  end

  local function add_player(player_id)
    if(get_player(player_id) == nil) then
	    local player = new_player(player_id)
	    table.insert(player_list, player)
  	end
  end

  local function remove_player(index)
    player = player_list[index]

    local player_channels = {
      "lages_movement_x_" .. player.get_id(),
      "lages_movement_y_" .. player.get_id(),
    }

    table.remove(player_list, index)
    server.mqtt:unsubscribe(player_channels)
  end

  local function check_collisions()
    local obstacle_list = obstacle_handler.get_obstacle_list()

    for player_index, player in ipairs(player_list) do
      player.update()
      for obstacle_index, obstacle in ipairs(obstacle_list) do
        if(collision.circle(player.get_x(), player.get_y(), player.get_radius(), obstacle.get_x(), obstacle.get_y(), obstacle.get_radius())) then
          remove_player(player_index)
          table.remove(obstacle_list, obstacle_index)
        end
      end
    end
  end

  local function update(dt)
  	local now = love.timer.getTime()

    check_collisions()

  	if(#player_list > 0) then
	  	if(obstacle_handler.is_time_to_spawn(now)) then
				obstacle_handler.spawn()
			end
			obstacle_handler.reduce_spawn_time(dt)
		end

		if(#player_list == 0) then
			obstacle_handler.reset()
		end

  	obstacle_handler.update(dt)
  end

  local function draw()
  	for _, player in ipairs(player_list) do
  		player.draw()
  	end
  	obstacle_handler.draw()
  end

  return {
    add_player = add_player,
    get_player = get_player,
    update = update,
    draw = draw,
  }
end

return new
