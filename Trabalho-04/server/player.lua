local version_control = require("version_control")

local function new(id)
  -- decidir posicao, cor, raio...
  local position_x = 100
  local position_y = 100
  local radius = 10

  local function draw()
    love.graphics.setColor(version_control.color(0.5, 0.5, 0.5))
    love.graphics.circle("fill", position_x, position_y, radius)
  end

  return {
    draw = draw,
  }
end

return new
