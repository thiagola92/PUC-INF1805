// Define os botões os quais quer ser avisado quando tiverem mudanças
// Chama button_changed() quando um dos botões definidos alterar de estado
void button_listen(int pin);

// Descobre se um botão está pressionado ou não
// Se o botão passado não tiver sido inicializado, retorna falso
boolean is_button_pressed(int pin);

// Define quando vai ser avisado que um determinado tempo chegou
// Chama timer_expired() a X millisegundos depois que o programa começar a rodar
void timer_set(long ms);

// Cancela o aviso que um determinado tempo chegou
void cancel_timer();
