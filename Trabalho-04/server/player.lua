local function new(id)
  -- decidir posicao, cor, raio...
  local position_x = 100
  local position_y = 100
  local radius = 10

  local function draw()
    love.graphics.setColor(red, green, blue, alpha)
    love.graphics.circle("fill", position_x, position_y, radius)
  end
end

return new
