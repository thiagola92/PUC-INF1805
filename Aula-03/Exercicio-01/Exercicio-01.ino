#include "pindefs.h"

// globais

volatile int buttonChanged = 0;

// Existem 3 registradores (PCMSK0, PCMSK1 e PCMSK2) que são responsáveis por interromper o arduino
// Todos eles tem o tamanho de 8 bits (1 byte) e começam como 0, ou seja, PCMSK0 começa {0000 0000}
// Cada bit diz que um Pin deve interromper quando acionado, ou seja, cada bit representa um Pin
// No caso do Arduino Uno, cada bit do PCMSK0 representa: {XTAL2, XTAL1, Pin 13, Pin 12, Pin 11, Pin 10, Pin 9, Pin 8}
// Então se quisermos que o arduino sejá interrompido quando o Pin 10 receber input, precisamos deixar o PCMSK0 como {0000 0100}
// Agora toda hora que o Pin 10 receber algum valor o arduino vai ser interrompido
//
// digitalPinToPCMSK(byte) é uma função para você descobrir em qual registrador o seu Pin está
// Como você pode notar o Pin 1, Pin 2, Pin 3...  não estão no PCMSK0
// Então se você chamar digitalPinToPCMSK(10) ele vai retorna o endereço do registrador desse Pin (no arduino uno vai retornar PCMSK0)
// Agora que você tem o endereço, você pode alterar o valor a vontade
// byte* registrador = digitalPinToPCMSK(10);
// *registrador = 0x04              // registrador vai armazenar o valor {0000 0100}
// Pelo código você descobriu o registrador do Pin 10
// Como que, pelo código, você descobre a posição do Pin 10?
//
// digitalPinToPCMSKbit(byte) é uma função para você descobrir em qual posição (dentro do seu registrador) o seu Pin está
// Existem 8 bits, qualquer um deles poderia ser o seu Pin
// {posicao 7, posicao 6, posicao 5, posicao 4, posicao 3, posicao 2, posicao 1, posicao 0}
// O Pin 10 está na posição 2
// Como já vimos Pin 10 estar ligado, seria {0000 0100}
// Agora que você consegue descobrir qual é o bit que representa o seu Pin
// posicao = digitalPinToPCMSKbit(10); // posicao vai ser 2
//
// Situação atual
// byte* registrador = digitalPinToPCMSK(10);     // Pegamos o registrador do Pin 10
// posicao = digitalPinToPCMSKbit(10);               // Pegamos qual a posição do bit que representa o Pin 10
// Agora queremos botar o bit que representa Pin 10 como 1
//
// bit(byte) é uma função que retorna o byte que seria formado se o bit da posição X estiver como 1 e o resto como 0
// Essa função recebe uma posição e retorna o bit daquela posição como 1
// Por exemplo, 
// 1º bit levantado {0000 0001}
// 2º bit levantado {0000 0010}
// 3º bit levantado {0000 0100}
// 4º bit levantado {0000 1000}
// ...
// bit(1) vai retornar {0000 0001}
// bit(2) vai retornar {0000 0010}
// bit(3) vai retornar {0000 0100}
// bit(4) vai retornar {0000 1000}
// ...
//
// Com isso conseguimos alterar o Pin que nos interessa no registrador:
// byte* registrador = digitalPinToPCMSK(10);
// posicao = digitalPinToPCMSKbit(10);
// *registrador = bit(posicao);         // registrador armazena {0000 0100}
// 
// Se deixarmos o código assim, só vai ter um Pin que vai poder interromper (o ultimo a chamar esse código)
// byte* registrador = digitalPinToPCMSK(10);
// posicao = digitalPinToPCMSKbit(10);
// *registrador = *registrador | bit(posicao);
//
// Agora se alguém botar {0010 0000}, você pode botar o bit do Pin 10 sem alterar o antigo
// {0010 0000} | {0000 0100} = {0010 0100}
// Dois Pins levantados
void pciSetup(byte pin) {
    *digitalPinToPCMSK(pin) |= bit (digitalPinToPCMSKbit(pin)); 
    PCIFR  |= bit (digitalPinToPCICRbit(pin)); // clear any outstanding interrupt // não estudei
    PCICR  |= bit (digitalPinToPCICRbit(pin)); // enable interrupt for the group // não estudei
}

// Quando uma interropção ocorre esse macro/tratadotr é chamado
// Interrupt Service Routine
ISR (PCINT1_vect) { // handle pin change interrupt for A0 to A5 here
   buttonChanged=0;
}  

void setup() {
  Serial.begin(9600);

  // Dizendo que os pins são para saida
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);

  // Deixando apagadas (lembrando que com o SHIELD HIGH é apagado e LOW é aceso, se não acredita tente inverter)
  digitalWrite(LED1,HIGH);
  digitalWrite(LED2,HIGH);

  // Dizendo que os pins são para receber
  pinMode(KEY1, INPUT_PULLUP); 
  pinMode(KEY2, INPUT_PULLUP);
  pinMode(KEY3, INPUT_PULLUP);

  // Essa é toda a parte que eu não entendo, sei que esse função faz
  // O arduino saber quando o botão X for apertado e interrompe tudo e chama "ISR(PCINT1_vect)"
  pciSetup(KEY1);
  pciSetup(KEY2);
  pciSetup(KEY3);
}


void loop() {
  if (buttonChanged) {
     digitalWrite(LED1,digitalRead(KEY1));
     digitalWrite(LED2,digitalRead(KEY2));
     buttonChanged = 0;
  }
}
