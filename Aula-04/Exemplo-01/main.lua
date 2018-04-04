function test()
  return {
    example = function ()
      print("example")
    end
  }
end

a = test()
for k,v in pairs(a) do
  print("----------")
  print(k)
  print(v)
  print("----------")
end

----------------------------------------------

function test()
  example = function ()
    print("example")
  end

  return {example}
end

a = test()
for k,v in pairs(a) do
  print("----------")
  print(k)
  print(v)
  print("----------")
end

----------------------------------------------

--Don't work
--function test()
--  return {
--    function example()
--      print("example2")
--    end
--  }
--end

----------------------------------------------

function test()
  function example()
    print("example")
  end

  return {example}
end

a = test()
for k,v in pairs(a) do
  print("----------")
  print(k)
  print(v)
  print("----------")
end
