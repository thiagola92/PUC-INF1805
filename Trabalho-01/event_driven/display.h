// Carrega as configuracoes necessarias para usar o display
void setupDisplay ();

// Escreve um numero em um segmento
// Segmentos vao de 0 a 3
// Numero vao de 0 a 9
void writeNumberToSegment(byte segment, byte value);

// Limpa o display, apaga tudo que estava escrito
void cleanDisplay();
