function newplayer ()
  local x, y = 0, 200
  local width, height = love.graphics.getDimensions( )

  local function getX()
    return x
  end

  local function update(dt)
    x = x + 0.5
    if x > width then
      x = 0
    end
  end

  local function draw()
    love.graphics.rectangle("line", x, y, 30, 10)
  end

  return {
    getX = getX,
    update = update,
    draw = draw
  }
end
