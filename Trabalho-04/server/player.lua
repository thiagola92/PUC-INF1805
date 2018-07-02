local version_control = require("version_control")

local function new(id)
  local position_x = love.graphics.getWidth() / 2
  local position_y = love.graphics.getHeight() / 2
  local step_x = 0
  local step_y = 0
  local radius = 10
  local speed = 5
  local red = love.math.random()
  local green = love.math.random()
  local blue = love.math.random()

  local function get_id()
    return id
  end

  local function get_x()
  	return position_x
  end

  local function get_y()
  	return position_y
  end

  local function get_radius()
  	return radius
  end

  local function update_x(x)
  	step_x = tonumber(x) * speed
  end

  local function update_y(y)
  	step_y = tonumber(y) * speed
  end

  local function update()
  	local new_position_x = position_x + step_x
  	local new_position_y = position_y + step_y
  	if(new_position_x < love.graphics.getWidth() and new_position_x > 0) then
			position_x = new_position_x
		end
		if(new_position_y < love.graphics.getHeight() and new_position_y > 0) then
			position_y = new_position_y
		end
  end

  local function draw()
    love.graphics.setColor(version_control.color(red, green, blue))
    love.graphics.circle("fill", position_x, position_y, radius)
  end

  return {
    get_id = get_id,
    get_x = get_x,
    get_y = get_y,
    get_radius = get_radius,
    update_x = update_x,
    update_y = update_y,
    update = update,
    draw = draw,
  }
end

return new
