int x = 0; //posición x
int dir = 1; //dirección x

void setup() {
  size(800, 160);
  fill(200);
  strokeWeight(2);
}

void draw() {
  background(255);

  //para la primera elipse usamos la variable x
  ellipse(x, 30, 40, 40);
  
  //para la primera elipse usamos la variable x dividida en 2
  ellipse(x/2, 80, 40, 40);
  
  //para la tercera ellipse creamos una variable que mapea el rango de x a valores entre 200 y 300 px
  //map(variable, inicio rango x, fin rango x, inicio nuevo rango, fin de nuevo rango
  //utilizamos float porque el resultado puede ser un número decimal
  float mapX = map(x, 0, width, 200, 300); 
  
  //utilizamos la nueva variable para el movimiento de la elipse
  ellipse(mapX, 130, 40, 40);

  x += 2 * dir; //cambio de posición

  //cambio de dirección
  if (x > width || x < 0) {
    dir = -dir;
  }
}
