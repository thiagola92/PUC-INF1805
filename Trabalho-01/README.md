## Grupo
* Leonardo Lages de Alencar - 1411485
* Thiago Lages de Alencar - 1721629

# Documentação


## Manual
O relógio tem 6 modos:  
* **NORMAL_MODE**  
* **NORMAL_MODE_HOUR**  
* **NORMAL_MODE_MINUTE**  
* **ALARM_MODE**  
* **ALARM_MODE_HOUR**  
* **ALARM_MODE_MINUTE**  

Os 3 primeiros modos são os modos do relógio normal.  
Os 3 ultimos modos são os modos do alarme.  

Esses modos definem o que vai aparecer no display, o horário do alarme ou o horário do relógio normal.  
Você consegue saber qual relógio está sendo exibido no display olhando para a LED4 (Pin 13):  
=> LED4 apagada: Relógio normal  
=> LED4 acesa: Alarme  

### Mudando de modos
* **NORMAL_MODE**: Basta estar em qualquer um dos modos do alarme e apertar KEY3  
* **NORMAL_MODE_HOUR**: Basta estar em qualquer um dos modos do alarme, segurar KEY3 e apertar KEY1  
* **NORMAL_MODE_MINUTE**: Basta estar em qualquer um dos modos do alarme, segurar KEY3 e apertar KEY2
* **ALARM_MODE**: Basta estar em qualquer um dos modos do relógio normal e apertar KEY3  
* **ALARM_MODE_HOUR**: Basta estar em qualquer um dos modos do relógio normal, segurar KEY3 e apertar KEY1  
* **ALARM_MODE_MINUTE**: Basta estar em qualquer um dos modos do relógio normal, segurar KEY3 e apertar KEY2  

#### NORMAL_MODE
Você está nesse estado?  
=> LED1 acesa/apagada  
=> LED2 apagada  
=> LED3 apagada  
=> LED4 apagada    

Para saber se o alarm está ligado ou desligado, basta olhar a LED1.  
=> LED1 apagada: Alarme desligado  
=> LED1 acesa: Alarme ligado  
Para desligar ou ligar o alarme, basta apertar KEY1.  
=> KEY1: Liga/desliga o alarme  

#### NORMAL_MODE_HOUR
Você está nesse estado?  
=> LED1 acesa/apagada  
=> LED2 apagada  
=> LED3 acesa  
=> LED4 apagada  

Você pode apertar KEY1 para aumentar as horas ou KEY2 para diminuir as horas.  
=> KEY1: Aumenta as horas  
=> KEY2: Diminui as horas  

#### NORMAL_MODE_MINUTE
Você está nesse estado?  
=> LED1 acesa/apagada  
=> LED2 acesa  
=> LED3 apagada  
=> LED4 apagada  

Você pode apertar KEY1 para aumentar os minutos ou KEY2 para diminuir os minutos.  
=> KEY1: Aumenta os minutos  
=> KEY2: Diminui os minutos  

#### ALARM_MODE
Você está nesse estado?  
=> LED1 acesa/apagada  
=> LED2 apagada  
=> LED3 apagada  
=> LED4 acesa  

Você pode apertar KEY2 para começar a gravar um toque personalizado para o alarme e com KEY1 adicionar os intervalos.  
=> KEY1: Adiciona novo intervalo no toque  
=> KEY2: Inicia/termina gravação  

#### ALARM_MODE_HOUR
Você está nesse estado?  
=> LED1 acesa/apagada  
=> LED2 apagada  
=> LED3 acesa  
=> LED4 acesa  

Você pode apertar KEY1 para aumentar as horas ou KEY2 para diminuir as horas.  
=> KEY1: Aumenta as horas  
=> KEY2: Diminui as horas  

#### ALARM_MODE_MINUTE
Você está nesse estado?  
=> LED1 acesa/apagada  
=> LED2 acesa  
=> LED3 apagada  
=> LED4 acesa  

Você pode apertar KEY1 para aumentar os minutos ou KEY2 para diminuir os minutos.  
=> KEY1: Aumenta os minutos  
=> KEY2: Diminui os minutos  

## Arquivos

**event_driven.ino**: Responsável por lidar com o problema de debounce e oferecer uma interface amigável para o usuário que estiver escrevendo o código no **app.ino**.   
**app.ino**:  Todo código responsável pelo relógio.  
**buzzer.ino**:  Funções responsáveis por interagir com o buzzer.  
**clock.ino**: Classe para representar um relógio, fazer operações entre relógios e armazena horario e minuto.  
**display.ino**:  Funções responsáveis por interagir com o display.  

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
