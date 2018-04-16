require "player"
require "blip"

updateList = {}

function wait(sec, blip)
  local time = love.timer.getTime() + sec
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

  print(updateList[1])
  print(updateList[1][1])
  print(updateList[1][2])
  local i = 1
  while(i <= #updateList) do
    if(time >= updateList[i][1]) then
      updateList[i][2]:update()
      table.remove(updateList, i)
    else
      i = i + 1
    end
  end

    --listabls[i]:update()

end
