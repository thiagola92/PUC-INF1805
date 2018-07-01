local new_client = require("client")
local resolution = require("res")
require("preload")

function love.load(args)
  GAME_WIDTH = 800
  GAME_HEIGHT = 600

  SCREEN_WIDTH = love.graphics.getWidth()
  SCREEN_HEIGHT = love.graphics.getHeight()

  love.window.setMode(GAME_WIDTH, GAME_HEIGHT, {resizable = true})
  resolution.set("fit", GAME_WIDTH, GAME_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)

  client = new_client(args[2], args[3])
end

function love.resize(w, h)
  SCREEN_WIDTH = w
  SCREEN_HEIGHT = h
  resolution.set("fit", GAME_WIDTH, GAME_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)
end

function love.draw()
  resolution.render(draw)
end

function love.update(dt)
  client:handler()
end

function love.mousepressed(key)
  client.publish("lages_new_player_" .. client.get_server_id(), key) -- testing
end
