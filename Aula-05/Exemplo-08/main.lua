function exemplo(a)
  print("--------------------------")
  print("Da mesma forma que thread pode receber valor, ")
  print("thread pode devolver um valor.")
  print("Isso é feito passando valores na 'yield'")
  print(a)
  print("--------------------------")
  coroutine.yield(10)
  print("--------------------------")
  print("'resume' é diferente de 'yield' pois não retorna simplesmente os valores extras passados, ")
  print("primeira coisa que retorna é se a thread está morta/finalizada, ")
  print("depois disso retorna cada um dos valores passados por 'yield'.")
  print("--------------------------")
end

function love.load()
  thread = coroutine.create(exemplo)
  valor = 3

  print("EXEMPLO 3")
  resposta, resposta2 = coroutine.resume(thread, valor)
  print(resposta)
  print(resposta2)
  print("RODANDOD NOVAMENTE")
  coroutine.resume(thread)
  print("FIM")
end

function love.update()
end

function love.draw()
end
