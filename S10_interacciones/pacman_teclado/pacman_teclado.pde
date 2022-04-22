Jugador bolita;
Jugador cuadradito;

int numAlimento = 20;
Alimento[] comidita;

void setup() {
  size(400, 400);
  bolita = new Jugador(width/2, height/2, 10, "FLECHAS");
  cuadradito = new Jugador(30, 30, 10, "WASD");

  comidita = new Alimento[numAlimento];
  for (int i = 0; i < numAlimento; i++) {
    comidita[i] = new Alimento();
  }
}

void draw() {
  background(255);

  for (int i = 0; i < numAlimento; i++) {
    comidita[i].mostrarse();
    comidita[i].revisarDistancia(bolita);
    comidita[i].revisarDistancia(cuadradito);
  }

  cuadradito.dibujarse();
  cuadradito.moverse();

  bolita.dibujarse();
  bolita.moverse();
}

void keyPressed() {
  bolita.cambiarDireccion(keyCode);
  cuadradito.cambiarDireccion(keyCode);
}
