function exemplo()
  print("--------------------------")
  print("Quando essa thread começar a rodar, ")
  print("ela vai começar a rodar a função do inicio.")
  print("Uma vez que a função terminar, ")
  print("a thread vai salvar onde parou dela (no caso, no fim).")
  print("Toda hora que você der 'resume' na thread, ela vai voltar de onde parou")
  print("Nesse caso, do fim")
  print("--------------------------")
end

function love.load()
  thread = coroutine.create(exemplo)

  print("EXEMPLO 1")
  coroutine.resume(thread)
  print("RODANDOD NOVAMENTE")
  coroutine.resume(thread)
  print("FIM")
end

function love.update()
end

function love.draw()
end
