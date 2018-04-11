function exemplo()
  print("--------------------------")
  print("Quando essa thread começar a rodar, ")
  print("ela vai começar a rodar a função do inicio.")
  print("Uma vez que você chama 'yield', ")
  print("a thread vai salvar onde parou dela.")
  print("Chamando yield:")
  print("--------------------------")
  coroutine.yield()
  print("--------------------------")
  print("Quando você der 'resume' na thread, ")
  print("ela vai voltar para o 'yield' que a parou")
  print("--------------------------")
end

function love.load()
  thread = coroutine.create(exemplo)

  print("EXEMPLO 2")
  coroutine.resume(thread)
  print("RODANDOD NOVAMENTE")
  coroutine.resume(thread)
  print("FIM")
end

function love.update()
end

function love.draw()
end
