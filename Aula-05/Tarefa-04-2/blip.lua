
function newblip (sec)
  local x, y = 0, 0
  local width, height = love.graphics.getDimensions( )

  local update = function(self)
    while true do
      x = x + 1
      if x > width then
        x = 0
      end
      wait(sec/100, self)
    end
  end

  local function affected(pos)
    if pos>x-10 and pos<x+10 then
      return true
    else
      return false
    end
  end

  local function draw()
    love.graphics.rectangle("line", x, y, 10, 10)
  end

  return {
    update = coroutine.wrap(update),
    affected = affected,
    draw = draw
  }
end
