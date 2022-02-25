//variable para definir el numero de rectangulso que se dibujan
int numRectangulos = 0;
int dir = 1; //dirección - aumentar o disminuir num de rectangulos

void setup() {
  size(800, 300);
  frameRate(2); // 2 frames por segundo
  
  fill(200);
  strokeWeight(2);
}

void draw() {
  background(255);

  //dibujar cada vez más rectangulos
  for (int i = 0; i < numRectangulos; i++) {
    //rectangulos con 80px de espacio entre si
    rect(i*80, 110, 60, 60);
  }

  //cambiar el límite en cada frame
  numRectangulos += 1 * dir; 

  //cambiar entre aumentar y disminuir cantidad de rects
  if (numRectangulos > 9 || numRectangulos < 0) {
    dir = -dir;
  }
}
