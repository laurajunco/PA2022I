import processing.sound.*;

SoundFile miCancion;
Waveform miForma; //variable de analizador de forma de onda

//definir numero de muestras
int muestras = 360;

//variables para guardar las posiciones de la forma de onda
float posiciones[];
float posSuavizadas[];

void setup() {
  size(800, 500);
  stroke(0, 70, 90);
  noFill();

  miCancion = new SoundFile(this, "papaya.wav");
  miForma = new Waveform(this, muestras); //cargar analizador de forma de onda

  //conectar analizador a cancion
  miForma.input(miCancion);

  //crear arreglos de posicion
  posiciones = new float[muestras];
  posSuavizadas = new float[muestras];

  //reproduce
  miCancion.cue(45);
  miCancion.play();
}

void draw() {
  background(225, 255, 255);
  strokeWeight(1);

  //Encender el analizador de forma de onda
  miForma.analyze();

  //obtener las posiciones de la onda
  posiciones = miForma.data;


  //1. Linea curva en el centro de la pantalla
  beginShape();
  //recorremos todos los puntos de la forma de onda
  for (int i = 0; i < muestras; i = i+1) {

    //mapeando a variables de posicion
    float y = map(posiciones[i], -1, 1, 0, height);
    float x = map(i, 0, muestras, 0, width);

    vertex(x, y); //pintar vertices
  }
  endShape();


  //2. Gráfica de Barras
  //recorremos todos los puntos de la forma de onda
  for (int i = 0; i < muestras; i++) {

    //mapeando a variables de posicion
    float x = map(i, 0, muestras, 0, width);
    float altura = map(posiciones[i], -1, 1, 0, height);

    line(x, height, x, altura); //pintar lineas
  }

  //3. Gráfica circular
  //trasladamos al centro
  pushMatrix();
  translate(width/2, height/2);

  //recorremos todos los puntos de la forma de onda
  for (int i = 0; i < muestras; i++) {

    //suavizado entre posicion anterior y posicion actual
    posSuavizadas[i] = lerp(posSuavizadas[i], posiciones[i], 0.1);
    float r = map(posSuavizadas[i], -1, 1, 0, width/2);
    float x = cos(radians(i)) * r;
    float y = sin(radians(i)) * r;

    strokeWeight(2);
    line(0, 0, x, y); //ñintamos las lineas
  }
  popMatrix();
}

void mousePressed() {
  if (miCancion.isPlaying() == true) {
    miCancion.stop();
  } else {
    miCancion.play();
  }
}
