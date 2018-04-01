## Grupo
* Leonardo Lages de Alencar - 1411485
* Thiago Lages de Alencar - 1721629

# Documentação


# Enunciado
## Miniprojeto 1: Relógio Despertador com Arduíno e placa multifunção
O objetivo desse miniprojeto é construir um relógio despertador usando um Arduino Uno ou Mega e o display de 7 segmentos, as 4 chaves e o beeper disponíveis na placa multifunção usada no curso.

As seguintes funcionalidades devem ser obrigatoriamente implementadas:
* acerto da hora mostrada
* acerto da hora do alarme e ligar/desligar função despertador

As chaves da placa devem ser usadas como interface para o usuário fazer esses acertos. O código deve cuidar do problema de debounce observado nos programas que lidam com a leitura das chaves. A interface exata deve ser projetada por cada grupo. Chaves e combinações delas podem fazer o relógio mudar de estado (acertando relógio, acertando alarme, etc) e os tempos de pressionamento e entre pressionamentos podem ser usados também. Os leds podem ser usados para indicar estados, incluindo uma indicação sobre o estado do alarme (ligado/desligado).

Cada grupo deve projetar e documentar o funcionamento de seu despertador, acrescentando mecanismos que achar interessante. (Exemplos de mecanismos extras seriam período de "soneca" e modos de "avanço" do display contínuo quando se mantém pressionada a chave de avanço.)

observação: Há zilhões de implementações de relógio despertador disponíveis na Internet. O melhor seria não usá-las, mas caso o faça, por favor documente em que aplicação se baseou e quais as alterações que fez. Não use a biblioteca MFS comumente distribuída juntamente com a placa.

## Data de entrega e apresentação em sala de aula: 1-3/4
O trabalho deve ser declarado completo no github de um dos integrantes do grupo até o dia 1/4, com envio de email para mim informando o grupo e a localização do trabalho. No dia 3/4 cada grupo demonstrará seu projeto.
