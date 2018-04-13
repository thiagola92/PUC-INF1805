function exemplo()
  print("--------------------------")
  print("Lado negaivo de dar 'wrap' é que você não tem como retorno o estado da thread")
  print("--------------------------")
  coroutine.yield()
  print("--------------------------")
  print("Isso retornou nil, em vez de true ou false")
  print("--------------------------")
end

function love.load()
  threadExemplo = coroutine.wrap(exemplo)

  print("EXEMPLO 9")
  retorno = threadExemplo()
  print(retorno)
  print("RODANDOD NOVAMENTE")
  threadExemplo()
  print("FIM")
end

function love.update()
end

function love.draw()
end
