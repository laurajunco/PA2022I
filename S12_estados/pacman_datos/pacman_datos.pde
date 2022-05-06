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
int PUNTAJES = 6;
int NOMBRE = 7;

//guarda el estado en el que estamos
int estadoActual;

int puntaje = 0;

int tiempoDeInicio = 0;
int tiempoLimite = 10000;

Table puntajes;
int numFilas;
String nombreJugador = "";


void setup() {
  size(400, 400);
  textSize(24);
  estadoActual = INICIO;

  //cargar table
  puntajes = loadTable("puntajes.csv", "header");

  bolita = new Jugador(width/2, height/2, 10, "FLECHAS");
  cuadradito = new Jugador(width/2, height/2, 10, "WASD");

  comidita = new Alimento[numAlimento];
  for (int i = 0; i < numAlimento; i++) {
    comidita[i] = new Alimento();
  }
}

void draw() {
  background(255);

  ///////////////////////////INICIO///////////////////////////
  if (estadoActual == INICIO) {
    //aqui deberia pasar todo lo que pasa en el inicio
    background(255, 0, 0);
    fill(255);
    textAlign(CENTER);
    text("INICIO", width/2, height/2);
  }

  ///////////////////////////MENU///////////////////////////

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

  ///////////////////////////NIVEL1///////////////////////////

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

    //si se pasa del tiempo pierde
    if (millis() > tiempoDeInicio + tiempoLimite) {
      if (puntaje >= 3) {
        estadoActual = GANAR;
      } else {
        estadoActual = PERDER;
      }
    }
  }

  ///////////////////////////GANAR///////////////////////////

  if (estadoActual == GANAR) {
    //aqui deberia pasar todo lo que pasa al ganar
    background(0, 0, 255);
    fill(0);
    textAlign(CENTER);
    text("FELICITACIONES!", width/2, height/2);
    text("GANASTE!!!!", width/2, height/2 + 20);
    //puntaje = 0;
    personajeSeleccionado.reestablecer();
    for (int i = 0; i < numAlimento; i++) {
      comidita[i].reestablecer();
    }
  }

  ///////////////////////////PERDER///////////////////////////
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

  ///////////////////////////NOMBRE///////////////////////////
  if (estadoActual == NOMBRE) {
    background(0, 255, 255);
    fill(0);
    text("Escriba su nombre", width/2, 30);
    text(nombreJugador, width/2, 60);
  }

  ///////////////////////////PUNTAJES///////////////////////////
  if (estadoActual == PUNTAJES) {
    fill(255);
    background(0, 0, 255);
    text("TOP 10", width/2, 30);
    numFilas = puntajes.getRowCount();

    for (int i = 0; i < numFilas; i++) {
      TableRow fila = puntajes.getRow(i);
      int puntaje = fila.getInt("puntaje");
      String jugador = fila.getString("jugador");
      text(jugador + ": " + puntaje, width/2, 60 + 25*i);
    }
  }
}

void keyPressed() {
  ///////////////////////////NIVEL1///////////////////////////
  if (estadoActual == NIVEL1) {
    personajeSeleccionado.cambiarDireccion(keyCode);

    ///////////////////////////NOMBRE///////////////////////////
  } else if (estadoActual == NOMBRE) {
    if (keyCode == SHIFT) {
      //no haga nada
    } else if (keyCode == BACKSPACE) {

      //borramos la ultima letra del nombre
      if (nombreJugador.length() > 0) {
        nombreJugador = nombreJugador.substring( 0, nombreJugador.length()-1 );
      }
    } else if (keyCode == ENTER) {
      //guardar una nueva fila en la tabla con el puntaje actual
      TableRow nuevaFila = puntajes.addRow();
      nuevaFila.setString("jugador", nombreJugador);
      nuevaFila.setInt("puntaje", puntaje);

      if (puntajes.getRowCount() > 5) {
        puntajes.removeRow(0);
      }

      //guardar nuestra tabla
      saveTable(puntajes, "data/puntajes.csv");
      puntajes = loadTable("puntajes.csv", "header");

      puntaje = 0;
      nombreJugador = "";
      estadoActual = PUNTAJES;
    } else {
      nombreJugador = nombreJugador + key;
    }
  }
}

void mouseReleased() {
  ///////////////////////////INICIO///////////////////////////
  if (estadoActual == INICIO) {
    estadoActual = MENU;
    ///////////////////////////MENU///////////////////////////
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
    ///////////////////////////GANAR///////////////////////////
  } else if (estadoActual == GANAR) {
    estadoActual = NOMBRE;
    ///////////////////////////PERDER///////////////////////////
  } else if (estadoActual == PERDER) {
    estadoActual = PUNTAJES;
    ///////////////////////////NOMBRE///////////////////////////
  } else if (estadoActual == NOMBRE) {
    estadoActual = PUNTAJES;
    ///////////////////////////PUNTAJES///////////////////////////
  } else if (estadoActual == PUNTAJES) {
    estadoActual = INICIO;
  }
}
