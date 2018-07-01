local function color(red, green, blue, alpha)
  local major, minor, revision = love.getVersion()

  red = red or 1
  green = green or 1
  blue = blue or 1
  alpha = alpha or 1

  if(major == 0 and minor < 10) then
    red = red / 255
    green = green / 255
    blue = blue / 255
  end

  return red, green, blue, alpha
end

return {
  color = color,
}
