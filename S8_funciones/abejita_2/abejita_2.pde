void setup() {
  size(600, 600);
  background(255);
  rectMode(CENTER);
  noStroke();
}

void draw() {
  //llamado a la función dibujarAbejita
  dibujarAbejita(200, 300);
  dibujarAbejita(300, 100);
}

//creamos la función que dibuja una abeja
//resibe los parametros posX y posY
void dibujarAbejita(float posX, float posY) {
  //alas
  fill(220);
  rect(posX, posY, 80, 20, 50);

  //cuerpo
  fill(250, 200, 30);
  rect(posX, posY, 40, 60, 60);

  //rayas
  fill(0);
  rect(posX, posY, 40, 5);
  rect(posX, posY + 10, 40, 5);

  //ojos
  ellipse(posX - 5, posY - 20, 5, 5);
  ellipse(posX + 5, posY - 20, 5, 5);
}
