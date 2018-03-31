// Define os botões os quais quer ser avisado quando tiverem mudanças
// Chama button_changed() quando um dos botões definidos alterar de estado
void button_listen(int pin);

// Define quando vai ser avisado que um determinado tempo chegou
// Chama timer_expired() a X millisegundos depois que o programa começar a rodar
//
// Durante o setup o programa não começou a rodar, logo o tempo rodado é 0
// Se você mandar chamar timer_expired(0)
// 0 millisegundos rodado + 0 millisegundos depois que começar a rodar = 0
// Parece que vai chamar assim que iniciar, mas se a soma disso der 0 event_driven vai encarar como se você não quisesse chamar
void timer_set(int ms);
