local new_client = require("client")

function love.load(args)
  client = new_client()
end

function love.draw()

end

function love.update(dt)
  client:handler()
end

function love.keypressed(key)
  client.publish("lages_new_player_" .. client.get_server_id(), key) -- testing
end
