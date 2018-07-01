local resolution = require("res")
local new_client = require("client")
local new_controller = require("controller")
local version_control = require("version_control")
require("preload")

function love.load(args)
  GAME_WIDTH = 800
  GAME_HEIGHT = 600

  SCREEN_WIDTH = love.graphics.getWidth()
  SCREEN_HEIGHT = love.graphics.getHeight()

  love.window.setMode(GAME_WIDTH, GAME_HEIGHT, {resizable = true})
  resolution.set("fit", GAME_WIDTH, GAME_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)

  client_id = args[2] or love.math.random()
  server_id = args[3] or 0
  
  client = new_client(client_id, server_id)
	controller = new_controller(client)
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
	local now = love.timer.getTime()
  client.mqtt:handler()

	if(controller.is_time_to_send(now)) then
		controller.send_movement()
	end
end

function love.mousepressed(x, y, button)
  if button == version_control.button(1) then
    client = new_client(client_id, server_id)
    controller = new_controller(client)
  end
end
