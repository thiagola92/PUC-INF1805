function rectangle(x, y, width, height)
  local originalX, originalY = x, y

  local function insideDraw()
    local mouseX, mouseY = love.mouse.getPosition()
    return (mouseX > x) and (mouseX < x + width) and (mouseY > y) and (mouseY < y + height)
  end

  local function draw()
    love.graphics.rectangle("line", x, y, width, height)
  end

  local function keypressed(key)
    if not insideDraw() then
      return
    end

    if key == 'b' then
      x = originalX
      y = originalY
    end

    if key == "down" then
      y = y + 10
    end

    if key == "up" then
      y = y - 10
    end

    if key == "right" then
      x = x + 10
    end

    if key == "left" then
      x = x - 10
    end
  end

  return { draw = draw, keypressed = keypressed }
end

function love.keypressed(key)
  for i=1, #rect do
    rect[i].keypressed(key)
  end
end

function love.load()
  rect = {}
  rect[1] = rectangle(100, 50, 200, 200)
  rect[2] = rectangle(300, 50, 150, 150)
end

function love.update()
end

function love.draw()
  for i=1, #rect do
    rect[i].draw()
  end
end
