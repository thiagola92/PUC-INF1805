/* Define shift register pins used for seven segment display */
#define LATCH_DIO 4
#define CLK_DIO 7
#define DATA_DIO 8

// Essa parte é complicada, você ja começa se perguntando o por que esta usando hexadecimal.
//
// Imagine que o display eh dividido em 4 partes, {x x x x}
// Voce tem 16 opcoes de escolher quais vao ficar acesos
// opcao 0 => {_ _ _ _} => todos apagados
// opcao 1 => {x _ _ _} => primeiro aceso e o resto apagado
// opcao 2 => {_ x _ _} => segundo aceso e o resto apagado
// opcao 3 => {x x _ _} => primeiro e segundo acesos e o resto apagado
// opcao 4 => {_ _ x _} => terceiro aceso e o resto apagado
// opcao 5 => {x _ x _} => primeiro e terceiro acesos e o resto apagado
// opcao 6 => {_ x x _} => segundo e terceiro acesos e o resto apagado
// opcao 7 => {x x x _} => primeiro, segundo e terceiro acesos e o resto apagado
// opcao 8 => {_ _ _ x} => quarto aceso e o resto apagado
// Se voce parar para notar o padrao, basicamente liga um dos segmentos e tenta fazer todas as combinacoes com os anteriores
// opcao 9 => {x _ _ x} => primeiro e quarto acesos e o resto apagado
// opcao 10=> {_ x _ x} => segundo e quarto acesos e o resto apagado
// opcao 11=> {x x _ x} => primeiro, segundo e quarto acesos e o resto apagado
// opcao 12=> {_ _ x x} => terceiro e quarto acesos e o resto apagado
// opcao 13=> {x _ x x} => primeiro, terceiro e quarto acesos e o resto apagado
// opcao 14=> {_ x x x} => segundo, terceiro e quarto acesos e o resto apagado
// opcao 15=> {x x x x} => todos acesos
// Para facilitar nossa vida, criamos um vetor com as 4 opcoes que importam
// O que eu nao sei dizer eh o pq no exemplo escolheram representar em hexadecimal
//
// Cada um desses valores representam quais partes do display vao ficar acesos
const byte SEGMENT_SELECT[] = {1, 2, 4, 8};

// Cada segmento do display tem luzes( 7 traços e 1 ponto)
// Para cada luz voce pode ter ela desligada ou ligada
// Funciona que nem acima mas existem muito mais combincacoes
// Mas no outro voce comea com todos segmentos apagados e vai acendendo eles
// Aqui voce comeca com todas luzes acesas e vai apagando elas
// Como seria um saco mostrar todas combinacoes de 8 luzes (2^8 == 256 combinacoes)
// Use esse exercicio para apertar o botao e ir vendo como as combinacoes sao formadas
//
// PS: Tambem n sei o pq no exemplo usou hexadecimal
// 
// Cada um desses valores representam um numero, indo de 0 a 9
const byte SEGMENT_MAP[] = {0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90};

byte count = 0;

void pciSetup(byte pin) {
    *digitalPinToPCMSK(pin) |= bit (digitalPinToPCMSKbit(pin)); 
    PCIFR  |= bit (digitalPinToPCICRbit(pin)); // clear any outstanding interrupt // nao estudei
    PCICR  |= bit (digitalPinToPCICRbit(pin)); // enable interrupt for the group // nao estudei
}

ISR (PCINT1_vect) { // handle pin change interrupt for A0 to A5 here
   count++;
}  

void setup ()
{
  Serial.begin(9600);
  
  pinMode(LATCH_DIO,OUTPUT);
  pinMode(CLK_DIO,OUTPUT);
  pinMode(DATA_DIO,OUTPUT); 
  
  pinMode(A1,INPUT_PULLUP); 
  pinMode(A2,INPUT_PULLUP); 
  pinMode(A3,INPUT_PULLUP); 

  pciSetup(A1);
  pciSetup(A2);
  pciSetup(A3);
}

/* Main program */
void loop()
{ 
  Serial.println(count);
  
  digitalWrite(LATCH_DIO,LOW); 
  shiftOut(DATA_DIO, CLK_DIO, MSBFIRST, count);
  shiftOut(DATA_DIO, CLK_DIO, MSBFIRST, 1);
  digitalWrite(LATCH_DIO,HIGH);
}

