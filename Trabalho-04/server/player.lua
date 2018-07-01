local version_control = require("version_control")

local function new(id)
  -- decidir posicao, cor, raio...
  local position_x = 100
  local position_y = 100
  local radius = 10

  local function get_id()
    return id
  end

  local function update_x(x)
  	x = tonumber(x)
  	position_x = position_x + x * 10
  end

  local function update_y(y)
  	y = tonumber(y)
  	position_y = position_y + y * 10
  end

  local function draw()
    love.graphics.setColor(version_control.color(0.5, 0.5, 0.5))
    love.graphics.circle("fill", position_x, position_y, radius)
  end

  return {
    get_id = get_id,
    update_x = update_x,
    update_y = update_y,
    draw = draw,
  }
end

return new
