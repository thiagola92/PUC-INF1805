#ifndef ARDUINO_CLOCK
#define ARDUINO_CLOCK

class Clock
{
  private:
    int hour;
    int minute;
    unsigned long millisecond;
    unsigned long lastUpdate;
  public:

    Clock();

    // Ajusta as horas do relogio
    // Se passar um numero com valor absoluto maior ou igual a 24, vai pegar apenas o resto da divisao por 24
    // Se passar numero negativo, vai somar 24 a esse numero
    void setHour(int hour);

    // Ajusta os minutos do relogio
    // Se passar um numero com valor absoluto maior ou igual a 60, vai pegar apenas o resto da divisao por 60
    // Se passar numero negativo, vai somar 60 a esse numero
    void setMinute(int minute);

    int getHour();

    int getMinute();

    // Atualiza hora, minuto e millisegundos do relogio
    void updateClock();
    
    // Apresenta no display o horario e minuto
    void displayClock();

    // Retorna a diferença de tempo entre um relogio e outro em millisegundos
    long differenceBetween(Clock c);
};

#endif
