local new_client = require("client")
local resolution = require("res")
require("configuration")

function love.load(args)
  client = new_client(args[2], args[3])
  resolution.set("fit", GAME_WIDTH, GAME_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)
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

function love.keypressed(key)
  client.publish("lages_new_player_" .. client.get_server_id(), key) -- testing
end
