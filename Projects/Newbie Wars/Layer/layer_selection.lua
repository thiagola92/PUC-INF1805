local function new()
  print("Loading layer selection")

  local width = love.graphics.getPixelWidth()
  local height = love.graphics.getPixelHeight()

  local function draw()

  end

  local function update()
  end

  local function keypressed()
  end

  return {
    load = load,
    draw = draw,
    update = update,
    keypressed = keypressed,
  }
end

return {
  new = new,
}
