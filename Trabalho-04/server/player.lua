local version_control = require("version_control")

local function new(id)
  -- decidir posicao, cor, raio...
  local position_x = 100
  local position_y = 100
  local step_x = 0
  local step_y = 0
  local radius = 10

  local function get_id()
    return id
  end

  local function update_x(x)
  	step_x = tonumber(x) * 2
  end

  local function update_y(y)
  	step_y = tonumber(y) * 2
  end

  local function update()
		position_x = position_x + step_x
		position_y = position_y + step_y
  end

  local function draw()
    love.graphics.setColor(version_control.color(0.5, 0.5, 0.5))
    love.graphics.circle("fill", position_x, position_y, radius)
  end

  return {
    get_id = get_id,
    update_x = update_x,
    update_y = update_y,
    update = update,
    draw = draw,
  }
end

return new
