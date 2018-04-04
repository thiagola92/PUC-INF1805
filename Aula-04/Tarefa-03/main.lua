function love.load()
  x = 50  y = 200
  w = 200 h = 150

  retangulos = {retangulo(x, y, w, h), retangulo(x+300, y, w, h)}
end

function naimagem (mouseX, mouseY, x, y)
  return (mouseX>x) and (mouseX<x+w) and (mouseY>y) and (mouseY<y+h)
end

function retangulo(x, y, width, height)
  local originalX, originalY = x, y

  return {
    draw = function ()
      love.graphics.rectangle("line", x, y, width, height)
    end
  ,
    keypressed = function (key)
      local mouseX, mouseY = love.mouse.getPosition()
      if key == 'b' and naimagem (mouseX, mouseY, x, y) then
         y = 200
      end

      if key == "down" and naimagem (mouseX, mouseY, x, y) then
        y = y + 10
      end

      if key == "right" and naimagem (mouseX, mouseY, x, y) then
        x = x + 10
      end

      if key == "up" and naimagem (mouseX, mouseY, x, y) then
        y = y - 10
      end

      if key == "left" and naimagem (mouseX, mouseY, x, y) then
        x = x - 10
      end
    end
  }
end

function love.keypressed(key)
  for i=1, #retangulos do
    retangulos[i].keypressed(key)
  end
end

function love.update (dt)
end

function love.draw ()
  for i=1, #retangulos do
    retangulos[i].draw()
  end
end
