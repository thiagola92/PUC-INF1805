## Grupo
Leonardo Lages de Alencar - 1411485
Thiago Lages de Alencar - 1721629

# Documentação

## About


## Server e Client
A conexão é feita usando [MQTT](https://en.wikipedia.org/wiki/MQTT) com a library apresentada em aula: http://geekscape.github.com/mqtt_lua  
Embora tenhamos nomeado o lado do jogador como *client* e o do jogo como *server*, ambos conseguem implementar as mesmas funcionalidades.  
**Client** tem como foco capturar as ações do jogador e passar para o server.  
**Server** recebe essas ações e utiliza para fazer o jogo.  

### Server
![server](img/server.jpg)  
Server inicia dando *subscribe* a um tópico dele. Esse tópico vai ser utilizado para saber se algum jogador deseja entrar no jogo.  
Se um jogador entrar no jogo, o server da subscribe a todos os tópicos daquele jogador.  

### Client
![client](img/client.jpg)  
A primeira coisa que o client faz é dar *publish* para o tópico do server. Dessa maneira o server sabe que aquele jogador quer jogar.  
Após isso ele fica eternamente dando publish para os tópicos dele mesmo.  
