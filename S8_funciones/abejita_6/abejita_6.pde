int numAbejas = 20;
float[] x = new float[numAbejas];
float[] y = new float[numAbejas];
color amarillo = color(250, 200, 30);

void setup() {
  size(600, 600);
  background(255);
  rectMode(CENTER);
  noStroke();

  //rellenamos el arreglo con posiciones aleatorias
  for (int i = 0; i < numAbejas; i++) {
    x[i] = random(50, width - 50);
    y[i] = random(50, height - 50);
  }
}

void draw() {
  background(255);

  //pintamos las abejas en las posiciones
  for (int i = 0; i < numAbejas; i++) {
    dibujarAbejita(x[i], y[i], amarillo);
  }
  
  //llamado a la funcion mover abejas
  moverAbejas();
}

void moverAbejas() {
  for (int i = 0; i < numAbejas; i++) {
    x[i] += random(-1, 1);
    y[i] += random(-1, 1);
  }
}


//función que dibuja una abeja
//recibe los parametros posX, posY y color
void dibujarAbejita(float posX, float posY, color col) {
  //alas
  fill(220);
  rect(posX, posY, 80, 20, 50);

  //cuerpo
  fill(col);
  rect(posX, posY, 40, 60, 60);

  //rayas
  fill(0);
  rect(posX, posY, 40, 5);
  rect(posX, posY + 10, 40, 5);

  //ojos
  ellipse(posX - 5, posY - 20, 5, 5);
  ellipse(posX + 5, posY - 20, 5, 5);
}
