class Jugador {
  float x, y; //posicion
  float dirX, dirY; //direccion
  float vel; //velocidad
  int tam; //tamaño
  String controles;

  Jugador(float px, float py, int pTam, String pControles) {
    x = px;
    y = py;
    tam = pTam;
    vel = 2;
    controles = pControles;
  }

  //funcion para dibujar un jugador
  void dibujarse() {
    noStroke();
    if (controles == "FLECHAS") {

      fill(255, 0, 0);
      circle(x, y, tam);
    } else if (controles == "WASD") {
      rectMode(CENTER);
      fill(0, 255, 0);
      square(x, y, tam);
    }
  }

  void reestablecer() {
    tam = 10;
    x = random(width);
    y = random(height);
    dirX = 0;
    dirY = 0;
  }

  void crecer() {
    tam = tam + 5;
  }

  void moverse() {
    x += dirX;
    y += dirY;

    x = constrain(x, tam/2, 400 - tam/2);
    y = constrain(y, tam/2, 400 - tam/2);
  }

  void cambiarDireccion(int tecla) {

    if (controles == "FLECHAS") {
      if (tecla == 37) { //LEFT es 37
        dirX = -vel; //velocidad en x negativa
        dirY = 0; //sin movimiento en y
      }

      if (tecla == 39) { //RIGHT es 39
        dirX = vel; //velocidad en x positiva
        dirY = 0; //sin movimiento en y
      }

      if (tecla == 38) { //UP es 38
        dirY = -vel; //velocidad en y negativa
        dirX = 0; //sin movimiento en x
      }

      if (tecla == 40) { //DOWN es 40
        dirY = vel; //velocidad en y positiva
        dirX = 0; //sin movimiento en x
      }
    }


    if (controles == "WASD") {
      if (tecla == 65) { //a es 65
        dirX = -vel; //velocidad en x negativa
        dirY = 0; //sin movimiento en y
      }

      if (tecla == 68) { //d es 68
        dirX = vel; //velocidad en x positiva
        dirY = 0; //sin movimiento en y
      }

      if (tecla == 87) { //w es 87
        dirY = -vel; //velocidad en y negativa
        dirX = 0; //sin movimiento en x
      }

      if (tecla == 83) { //S es 83
        dirY = vel; //velocidad en y positiva
        dirX = 0; //sin movimiento en x
      }
    }
  }
}
