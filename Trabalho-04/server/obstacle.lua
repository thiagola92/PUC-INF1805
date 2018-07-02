local version_control = require("version_control")

local function new(modifier)
  local position_x = love.math.random(0, love.graphics.getWidth())
  local position_y = 0
  local radius = 10 * (1 + modifier)
  local speed = 100 * (1 + modifier)

  local function get_x()
    return position_x
  end

  local function get_y()
    return position_y
  end

  local function get_radius()
    return radius
  end

  local function update(dt)
    position_y = position_y + speed * dt
  end

  local function draw()
    love.graphics.setColor(version_control.color(0.5, 0.5, 0.5))
    love.graphics.circle("fill", position_x, position_y, radius)
  end

	return {
    get_x = get_x,
    get_y = get_y,
    get_radius = get_radius,
    update = update,
    draw = draw,
  }
end

return new
