local server = require("server")

function love.load(args)
  game_server = server.new(args[2])
end

function love.draw()

end

function love.update(dt)
  game_server:handler()
end

function love.keypressed(key)
  game_server.publish("lages_new_player_", key)
end
