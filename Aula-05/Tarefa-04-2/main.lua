require "player"
require "blip"

updateList = {}

function wait(sec, blip)
  local time = love.timer.getTime() + sec + 0.02  -- Sem o 0.02 os blips 2 e 3 ficavam sincronizados(não sei se apenas no meu computador)
  local newUpdate = {time, blip}

  table.insert(updateList, newUpdate)

  coroutine.yield()
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
    listabls[i]:update()
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

  local time = love.timer.getTime()
  local i = 1
  local size = #updateList
  while(i <= size) do

    if(time >= updateList[i][1]) then
      updateList[i][2]:update()
      table.remove(updateList, i)
      size = size - 1
    else
      i = i + 1
    end

  end

end
