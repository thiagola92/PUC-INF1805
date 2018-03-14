#define LED 13
#define KEY1 A1

#define low HIGH
#define high LOW

void setup() {
  pinMode(KEY1, INPUT_PULLUP);
  pinMode(LED, OUTPUT);

}

void loop() {
  digitalWrite(LED, low);
  delay(1000);
  digitalWrite(LED, high);
  delay(1000);

  int pressed = digitalRead(KEY1);
  if(!pressed) {
    digitalWrite(LED, high);
    while(1);
  }
}
