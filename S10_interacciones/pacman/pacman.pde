Jugador bolita;
Alimento[] comidita;

void setup() {
  size(600, 600);
  background(255);
  
  bolita = new Jugador();
  comidita = new Alimento[20];
  
  for(int i = 0; i < 20; i++) {
    comidita[i] = new Alimento();
  }
}

void draw() {
  background(255);
  bolita.mostrarse();
  bolita.moverse(mouseX, mouseY);
  
  for(int i = 0; i < 20; i++) {
    comidita[i].mostrarse();
    comidita[i].revisarDistancia(bolita);
  }
}
