size(1000, 1000);
background(255);
fill(0);
noStroke();

int ancho = 40; //ancho de los triangulos

//triangulos negros
for (int y = 0; y < height; y+=ancho) {
  for (int x = 0; x < width-y; x+=ancho) {
    triangle(x, y, x+ancho, y, x, y+ancho);
  }
}

//triangulos amarillos
fill(201, 185, 138);
for (int y = 0; y < height; y+=ancho) {
  for (int x = width-y-ancho; x < width; x+=ancho) {
    triangle(x+ancho, y, x+ancho, y+ancho, x, y+ancho);
  }
}
