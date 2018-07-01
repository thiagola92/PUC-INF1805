local function button(button)
  local major, minor, revision = love.getVersion()

  if(major == 0 and minor < 10) then
    if button == 1 then
      button = "l"
    elseif button == 2 then
      button = "r"
    elseif button == 3 then
      button = "m"
    end
  end

  return button
end

return {
  button = button,
}
