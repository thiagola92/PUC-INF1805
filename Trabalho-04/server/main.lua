local new_server = require("server")
local new_game = require("game")

function love.load(args)
  game = new_game()
  server = new_server(args[2])
end

function love.draw()

end

function love.update(dt)
  server.mqtt:handler()
end

function love.keypressed(key)
  server.mqtt:publish("lages_new_player_" .. server.get_id(), key) -- testing
end
