// Carrega as configuracoes necessarias para usar o buzzer
void setupBuzzer();

// Remove todo o schedule
void cleanSchedule();

// Troca o estado do buzzer de acordo com o schedule montado
// Criado para conseguir fazer musica/toque
void playSchedule();

// Adiciona ao schedule na posicao desejada
void addSchedule(int pos_schedule, unsigned long ms);

// Volta para o inicio do schedule
void resetSchedule();

// Forma mais bruta de alterar o estado do buzzer
void changeBuzzerAfter(boolean state, unsigned long ms);
