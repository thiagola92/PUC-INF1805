local menu = require "Screen/screen_menu"

function love.load()
  screen = menu.new()
end

function love.draw()
  screen.draw()
end

function love.update()
  screen.update()
end

function love.keypressed(key)
  screen.keypressed(key)
end
