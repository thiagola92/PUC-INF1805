local new_accelerometer = require("accelerometer")

local function new(client)
  local accelerometer = new_accelerometer()
  local last_x = 0
  local last_y = 0
  local next_send_time = 0

  local function is_time_to_send(now)
    local difference_x = math.abs(accelerometer.get_x() - last_x)
    local difference_y = math.abs(accelerometer.get_y() - last_y)

    --if(now >= next_send_time) then
      if(difference_x >= 0.1 or difference_y >= 0.1) then
        return true
      end
    --end

    return false
  end

  local function send_movement()
  	while true do
      last_x = accelerometer.get_x()
      last_y = accelerometer.get_y()
  		client.mqtt:publish("lages_movement_x_" .. client.get_id(), last_x)
  		client.mqtt:publish("lages_movement_y_" .. client.get_id(), last_y)
  		--next_send_time = love.timer.getTime() + 0.1
  		coroutine.yield()
  	end
  end

  return {
    is_time_to_send = is_time_to_send,
    send_movement = coroutine.wrap(send_movement),
  }
end

return new
