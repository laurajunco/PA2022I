Jugador bolita;
Jugador cuadradito;
Jugador personajeSeleccionado;

int numAlimento = 20;
Alimento[] comidita;

//definir nuestros estados
int INICIO = 1;
int MENU = 2;
int NIVEL1 = 3;
int PERDER = 4;
int GANAR = 5;

//guarda el estado en el que estamos
int estadoActual;

int puntaje = 0;

int tiempoDeInicio = 0;
int tiempoLimite = 10000;


void setup() {
  size(400, 400);
  textSize(24);
  estadoActual = INICIO;

  bolita = new Jugador(width/2, height/2, 10, "FLECHAS");
  cuadradito = new Jugador(width/2, height/2, 10, "WASD");

  comidita = new Alimento[numAlimento];
  for (int i = 0; i < numAlimento; i++) {
    comidita[i] = new Alimento();
  }
}

void draw() {
  background(255);

  if (estadoActual == INICIO) {
    //aqui deberia pasar todo lo que pasa en el inicio
    background(255, 0, 0);
    fill(255);
    textAlign(CENTER);
    text("INICIO", width/2, height/2);
  }

  ///////////////////////////INICIO///////////////////////////

  if (estadoActual == MENU) {
    //aqui deberia pasar todo lo que pasa en el inicio
    background(0, 255, 0);
    fill(0);
    textAlign(CENTER);
    text("MENU", width/2, 40);
    text("Escoge tu personaje!", width/2, 70);

    //boton 1
    fill(0);
    circle(width/2 - 75, height/2, 40);

    //boton 2
    fill(255);
    rectMode(CENTER);
    square(width/2 + 75, height/2, 40);
  }

  ///////////////////////////MENU///////////////////////////

  if (estadoActual == NIVEL1) {
    fill(0);
    textAlign(LEFT);
    text("PUNTAJE: " + puntaje, 20, 30);

    textAlign(RIGHT);
    int tiempoRestante = (tiempoLimite + tiempoDeInicio - millis())/1000;
    text("Tiempo: " + tiempoRestante, width - 20, 30);

    for (int i = 0; i < numAlimento; i++) {
      comidita[i].mostrarse();
      if (comidita[i].revisarDistancia(personajeSeleccionado) == true) { //true o false
        puntaje = puntaje + 1;
      }
    }

    personajeSeleccionado.dibujarse();
    personajeSeleccionado.moverse();

    //si tiene el puntaje para ganar cambia de estado
    if (puntaje >= 10) {
      estadoActual = GANAR;
    }

    //si se pasa del tiempo pierde
    if (millis() > tiempoDeInicio + tiempoLimite) {
      estadoActual = PERDER;
    }
  }

  ///////////////////////////NIVEL!///////////////////////////

  if (estadoActual == GANAR) {
    //aqui deberia pasar todo lo que pasa al ganar
    background(0, 0, 255);
    fill(0);
    textAlign(CENTER);
    text("FELICITACIONES!", width/2, height/2);
    text("GANASTE!!!!", width/2, height/2 + 20);
    puntaje = 0;
    personajeSeleccionado.reestablecer();
    for (int i = 0; i < numAlimento; i++) {
      comidita[i].reestablecer();
    }
  }

  if (estadoActual == PERDER) {
    //aqui deberia pasar todo lo que pasa al ganar
    background(255, 0, 0);
    fill(0);
    textAlign(CENTER);
    text("PERDISTE :(", width/2, height/2);
    puntaje = 0;
    personajeSeleccionado.reestablecer();
    for (int i = 0; i < numAlimento; i++) {
      comidita[i].reestablecer();
    }
  }
}

void keyPressed() {
  personajeSeleccionado.cambiarDireccion(keyCode);
}

void mouseReleased() {
  //cambiar de nivel cuando oprimo el mouse
  if (estadoActual == INICIO) {
    estadoActual = MENU;
  } else if (estadoActual == MENU) {
    //antes de pasar al nivel 1
    //vamos a guardar el tiempo de inicio
    tiempoDeInicio = millis();

    //seleccionar bolita boton 1
    if (dist(mouseX, mouseY, width/2 - 75, height/2) < 100) {
      personajeSeleccionado = bolita;
      estadoActual = NIVEL1;

      //seleccionar cuadraito boton 2
    } else if (dist(mouseX, mouseY, width/2 + 75, height/2) < 100) {
      personajeSeleccionado = cuadradito;
      estadoActual = NIVEL1;
    }
    //si ganamos o perdemos volvemos al inicio
  } else if (estadoActual == GANAR || estadoActual == PERDER) {
    estadoActual = INICIO;
  }
}
