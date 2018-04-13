function exemplo(a, b)
  print("--------------------------")
  print("Nos vimos que se vc passar mais valor do que a função vai receber, ")
  print("a função descarta tudo a mais.")
  print("Se você passar menos")
  print(a)
  print(b)
  print("O resto vai como nil")
  print("--------------------------")
  coroutine.yield()
  print("--------------------------")
  print("Nada mais a dizer")
  print("--------------------------")
end

function love.load()
  thread = coroutine.create(exemplo)
  valor = 3

  print("EXEMPLO 5")
  coroutine.resume(thread, valor)
  print("RODANDOD NOVAMENTE")
  coroutine.resume(thread)
  print("FIM")
end

function love.update()
end

function love.draw()
end
