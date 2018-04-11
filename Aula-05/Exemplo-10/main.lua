a = 0
while(a < 10) do
  print(a)
  a = a + 1
  local a = 5
end

print("-----------------")

for a=0, 9 do
  print(a)
  local a = 5
end

print("-----------------")

-- until will use the a from the loop
-- you will stay in this loop forever
a = 0
repeat
  print(a)
  a = a + 1
  local a = 5
until(a >= 10)
