layer_selection = require "Layer/layer_selection"

local function new()
  print("Loading screen game")

  local selection = layer_selection.new()

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
