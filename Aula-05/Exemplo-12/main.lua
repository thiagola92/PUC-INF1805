function exemplo()
  print("--------------------------")
  print("Lado positivo é que ainda retorna os valores que você quer passar")
  print("--------------------------")
  coroutine.yield(420)
  print("--------------------------")
  print("Isso retornou 420, ")
  print("você não teve nem q filtrar o primeiro retorno, ")
  print("ou seja, ")
  print("não precisou fazer retorno1, retorno2 = couritine.resume(threadExemplo)")
  print("--------------------------")
end

function love.load()
  threadExemplo = coroutine.wrap(exemplo)

  print("EXEMPLO 10")
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
