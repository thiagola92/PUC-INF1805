#define LED 13
#define KEY1 A1

#define low HIGH
#define high LOW

int state = 1;
unsigned long next_blink = 0;

void setup() {
  pinMode(KEY1, INPUT_PULLUP);
  pinMode(LED, OUTPUT);

}

void loop() {
  int now = millis();
  if(now >= next_blink) {
    state = !state;
    digitalWrite(LED, state);
    next_blink = now + 1000;
  }
  
  checkIfPressed();
}

void checkIfPressed() {
  int pressed = digitalRead(KEY1);
  if(!pressed) {
    digitalWrite(LED, high);
    while(1);
  }
}

