local function new()
	local accelerometer
	local joysticks = love.joystick.getJoysticks()
  for i, joystick in ipairs(joysticks) do
    if joystick:getName() == "Android Accelerometer" then
      accelerometer = joystick
    end
	end

	local next_send_time = 0

	local function get_axis_x()
		return accelerometer:getAxis(1)
	end

	local function get_axis_y()
		return accelerometer:getAxis(2)
	end

	return {
		get_x = get_axis_x,
		get_y = get_axis_y,
	}
end

return new
