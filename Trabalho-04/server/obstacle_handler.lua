local new_obstacle = require("obstacle")

local function new()
  local obstacle_list = {}
  local next_spawn_time = 0
  local spawn_delay = 0.5
  local obstacles_spawned = 0
  local max_modifier = 0

  local function is_time_to_spawn(now)
    if now >= next_spawn_time then
      return true
    end
    return false
  end

  local function spawn()
    local obstacle = new_obstacle(love.math.random(0, max_modifier))
    table.insert(obstacle_list, obstacle)
    next_spawn_time = love.timer.getTime() + spawn_delay
  end

  local function reduce_spawn_time(dt)
    if spawn_delay > 0.05 then
      spawn_delay = spawn_delay - (dt / 100)
    else
      spawn_delay = 0.05
    end
    if max_modifier < 2 then
      max_modifier = max_modifier + (dt / 100)
    else
      max_modifier = 2
    end
  end

  local function get_obstacle_list()
    return obstacle_list
  end

  local function update(dt)
    for i, obstacle in ipairs(obstacle_list) do
      obstacle.update(dt)
      if obstacle.get_y() > love.graphics.getHeight() then
        table.remove(obstacle_list, i)
      end
    end
  end

  local function draw()
    for _, obstacle in ipairs(obstacle_list) do
      obstacle.draw()
    end
  end

  return {
    is_time_to_spawn = is_time_to_spawn,
    spawn = spawn,
    reduce_spawn_time = reduce_spawn_time,
    get_obstacle_list = get_obstacle_list,
    update = update,
    draw = draw,
  }
end

return new