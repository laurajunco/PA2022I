class Abeja {
  
  //variables o información de una abeja
  float posX;
  float posY;
  color col;
  boolean estaMuerta;

  //método constructor: establecemos las condiciones iniciales
  Abeja(float x, float y, color c) {
    posX = x;
    posY = y;
    col = c;
    estaMuerta = false;
  }

  /* funciones */

  //función para dibujar una abeja
  void dibujarse() {
    rectMode(CENTER);
    noStroke();

    //alas
    fill(220);
    rect(posX, posY, 80, 20, 50);

    //cuerpo
    //si esta muerta se pinta de un color diferente
    if (estaMuerta == true) {
      fill(180);
    } else {
      fill(col);
    }

    rect(posX, posY, 40, 60, 60);

    //rayas
    fill(0);
    rect(posX, posY, 40, 5);
    rect(posX, posY + 10, 40, 5);

    //ojos
    ellipse(posX - 5, posY - 20, 5, 5);
    ellipse(posX + 5, posY - 20, 5, 5);
  }

  //funcion de movimiento
  void volar() {

    //solo se mueve si esta viva
    if ( estaMuerta == false) {
      posX = posX + random(-1, 1);
      posY = posY + random(-1, 2);
    }

    //condicion que llama a la funcion morir
    if (posY > 500) {
      morir();
    }
  }

  void morir() {
    estaMuerta = true;
  }

  void revivir() {
    estaMuerta = false;
  }
}
