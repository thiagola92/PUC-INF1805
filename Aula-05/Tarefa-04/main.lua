function newblip (vel)
  local x, y = 0, 0

  local function update()
    local width, height = love.graphics.getDimensions( )
    x = x+vel
    if x > width then
    -- volta para a esquerda da janela
      x = 0
    end
  end

  local function affected(pos)
    if pos>x-10 and pos<x+10 then
    -- "pegou" o blip
      return true
    else
      return false
    end
  end

  local function draw()
    love.graphics.rectangle("line", x, y, 10, 10)
  end

  return {
    update = update,
    affected = affected,
    draw = draw
  }
end

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

function love.keypressed(key)
  if key == 'a' then
    pos = player.getX()
    for i in ipairs(listabls) do
      local hit = listabls[i].affected(pos)
      if hit then
        table.remove(listabls, i) -- esse blip "morre"
        return -- assumo que apenas um blip morre
      end
    end
  end
end

function love.load()
  player =  newplayer()
  listabls = {}
  for i = 1, 5 do
    listabls[i] = newblip(i)
  end
end

function love.draw()
  player.draw()
  for i = 1,#listabls do
    listabls[i].draw()
  end
end

function love.update(dt)
  player.update(dt)
  for i = 1,#listabls do
    listabls[i].update()
  end
end
