local new_server = require("server")
local new_game = require("game")

function love.load(args)
  game = new_game()
  game_server = new_server(args[2])
end

function love.draw()

end

function love.update(dt)
  game_server:handler()
end

function love.keypressed(key)
  game_server.publish("lages_new_player_" .. game_server.get_id(), key) -- testing
end
