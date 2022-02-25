//definimos una variable para un angulo que va a cambiar
float angulo; 

//variable para el radio del movimiento
float radio = 120;

void setup() {
  size(800, 400);
  fill(255);
}

void draw() {
  noStroke();
  //para el efecto del fondo pintamos un rectangulo que ocupa toda la pantalla
  // y le damos una opacidad al fill
  fill(255, 50);
  rect(0, 0, width, height);
  
  //utilizamos seno y coseno del angulo para obtener las posiciones en X y Y
  //obtener X y Y, multiplicarlo por el radio
  //reciben angulos en radianes 0 a 6.14
  float x = cos(angulo) * radio;
  float y = sin(angulo) * radio;
  
  //sumamos a X y Y la mitad del tamño del lienzo
  //para que el movimiento este en el centro del lienzo
  x = x + width/2; 
  y = y + height/2;
  
  //utlizamos X y Y para la posición de la elipse 
  stroke(0);
  ellipse(x, y, 50, 50);

  //aumentar el angulo
  angulo += 0.05;
  println(angulo); //imprimir en la consola
}
