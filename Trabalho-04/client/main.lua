local new_accelerometer = require("accelerometer")
local new_client = require("client")
local resolution = require("res")
require("preload")

local function send_movement()
	while true do
		-- ENABLE THIS WHEN TESTING WITH ANDROID
		--client.mqtt:publish("lages_movement_x_" .. client.get_id(), accelerometer.get_x())
		--client.mqtt:publish("lages_movement_y_" .. client.get_id(), accelerometer.get_y())
		next_send_time = love.timer.getTime() + 0.1
		coroutine.yield()
	end
end

send_client_movement = coroutine.wrap(send_movement)

function love.load(args)
  GAME_WIDTH = 800
  GAME_HEIGHT = 600

  SCREEN_WIDTH = love.graphics.getWidth()
  SCREEN_HEIGHT = love.graphics.getHeight()

  love.window.setMode(GAME_WIDTH, GAME_HEIGHT, {resizable = true})
  resolution.set("fit", GAME_WIDTH, GAME_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)

  client = new_client(args[2], args[3])
  accelerometer = new_accelerometer()

  next_send_time = 0
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

  if now >= next_send_time then
  	send_client_movement()
	end
end

function love.mousepressed(key)
end
