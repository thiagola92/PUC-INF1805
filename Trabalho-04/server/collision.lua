local function circle(x, y, radius, x2, y2, radius2)
  local distance = math.sqrt((x - x2)^2 + (y - y2)^2)
  return distance < radius + radius2
end

return {
  circle = circle,
}
