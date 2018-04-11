function exemplo(a)
  print("--------------------------")
  print("Toda 'resume' pode ou não passar valor.")
  print("O primeiro 'resume' manda os valores para o cabeçario da função.")
  print("Para que mandar valor no segundo/terceiro/quarto 'resume'?")
  print("Afinal não vai passar no cabeçario da função")
  print(a)
  print("--------------------------")
  b = coroutine.yield()
  print("--------------------------")
  print("Os próximos 'resume' são o retorno da 'yield'")
  print("Dessa maneira, você tem como passar valor para essa thread")
  print(b)
  print("--------------------------")
end

function love.load()
  thread = coroutine.create(exemplo)
  valor = 3
  valor2 = 420

  print("EXEMPLO 3")
  coroutine.resume(thread, valor)
  print("RODANDOD NOVAMENTE")
  coroutine.resume(thread, valor2)
  print("FIM")
end

function love.update()
end

function love.draw()
end
