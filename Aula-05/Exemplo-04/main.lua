function exemplo()
  print("--------------------------")
  print("Essa thread começou a rodar e recebeu 'valor', ")
  print("como a função não recebe variaveis, ")
  print("ela descartou 'valor'")
  print("--------------------------")
  coroutine.yield()
  print("--------------------------")
  print("Nada mais a dizer")
  print("--------------------------")
end

function love.load()
  thread = coroutine.create(exemplo)
  valor = 3

  print("EXEMPLO 3")
  coroutine.resume(thread, valor)
  print("RODANDOD NOVAMENTE")
  coroutine.resume(thread)
  print("FIM")
end

function love.update()
end

function love.draw()
end
