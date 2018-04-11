function exemplo()
  print("--------------------------")
  print("Em vez de ficar escrevendo 'coroutine.resume(exemplo)', ")
  print("você pode usar a função 'wrap' para associar a um variavel, ")
  print("dessa maneira você pode escrever 'threadExemplo()' para chamar")
  print("--------------------------")
  coroutine.yield()
  print("--------------------------")
  print("Imagine como um açucar sintático, ")
  print("coroutine.resume = threadExemplo")
  print("OBS: Lembre-se de dar o nome que quiser para a thread")
  print("--------------------------")
end

function love.load()
  threadExemplo = coroutine.wrap(exemplo)

  print("EXEMPLO 3")
  threadExemplo()
  print("RODANDOD NOVAMENTE")
  threadExemplo()
  print("FIM")
end

function love.update()
end

function love.draw()
end
