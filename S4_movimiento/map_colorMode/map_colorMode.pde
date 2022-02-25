int x = 0;
int dir = 1;

void setup() {
  size(800, 400);
  fill(255);
  noStroke();
  
  //modo de color que viene por defecto en processing
  //colorMode(RGB, 255, 255, 255); 
  
  //declaramos que se utilice el modo de color HSB tono-saturación-brillo
  //colorMode(HSB, rango H (0-360), rango S (0-100), rango B (0-100));
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(255, 0, 100);

  //creamos una nueva variable para el tono de nuestra elipse
  // el tono mapea el rango de x a un nuevo rango entre 37 y 154
  // tono va de naranja (37) a verde (154)
  float tono = map(x, 0, width, 37, 154);
  
  //utilizamos la nueva variable para definir el tono de nuestro fill
  fill(tono, 100, 100); 
  rect(x, 50, 300, 300);
  
  x += 2 * dir; //cambio de posición

  //cambio de dirección
  if (x > width || x < 0) {
    dir = -dir;
  }
}
