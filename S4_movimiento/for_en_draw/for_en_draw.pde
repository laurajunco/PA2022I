//los rectangulos comienzan fuera del lienzo
int x = -800; //posición x

void setup() {
  size(800, 300);  
  fill(200);
  strokeWeight(2);
}

void draw() {
  background(255);

  //dibujar 10 rectangulos
  for (int i = 0; i < 10; i++) {
    //rectangulos con 80px de espacio entre si
    // a cada rectangulo se le suma x en la posicion horizontal
    rect( x + (i*80), 110, 60, 60);
  }

  x += 5; //aumento de x

  //cambio de dirección
  if (x > width || x < -800) {
    x = -800;
  }
}
