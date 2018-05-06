local screen_game = require "Screen/screen_game"

local function new()
  print("Loading scren menu")
  
  local NUMBER_OF_SELECTIONS = 3
  local selection = 2

  local function draw_create_game_button()
    love.graphics.setColor(0.75, 0.75, 0.75)
    love.graphics.rectangle("fill", 0, 0, 160, 30)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Create game", 0, 0, 0, 2)

    if(selection == 1) then
      love.graphics.setColor(0.75, 0.75, 0.75)
      love.graphics.polygon("fill", 160, 15, 160 + 15, 15 + 10, 160 + 15, 15 - 10)
    end
  end

  local function draw_join_game_button()
    love.graphics.setColor(0.75, 0.75, 0.75)
    love.graphics.rectangle("fill", 0, 30 + 5, 160, 30)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("  Join game", 0, 30 + 5, 0, 2)

    if(selection == 2) then
      love.graphics.setColor(0.75, 0.75, 0.75)
      love.graphics.polygon("fill", 160, 30 + 5 + 15, 160 + 15, 30 + 5 + 15 + 10, 160 + 15, 30 + 5 + 15 - 10)
    end
  end

  local function draw_options_button()
    love.graphics.setColor(0.75, 0.75, 0.75)
    love.graphics.rectangle("fill", 0, 60 + 10, 160, 30)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("   Options", 0, 60 + 10, 0, 2)

    if(selection == 3) then
      love.graphics.setColor(0.75, 0.75, 0.75)
      love.graphics.polygon("fill", 160, 60 + 10 + 15, 160 + 15, 60 + 10 + 15 + 10, 160 + 15, 60 + 10 + 15 - 10)
    end
  end

  local function draw()
    draw_create_game_button()
    draw_join_game_button()
    draw_options_button()
  end

  local function update()
  end

  local function move_selection(value)
    selection = selection + value
    if (selection < 1) then
      selection = NUMBER_OF_SELECTIONS
    elseif (selection > NUMBER_OF_SELECTIONS) then
      selection = 1
    end
  end

  local function select()
    if (selection == 1) then
      screen = screen_game.new()
    elseif (selection == 2) then
    elseif (selection == 3) then
    end
  end

  local function keypressed(key)
    if (key == "w" or key == "up") then
      move_selection(-1)
    elseif (key == "s" or key == "down") then
      move_selection(1)
    elseif (key == "space") then
      select()
    end
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
