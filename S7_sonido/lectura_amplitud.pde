import processing.sound.*;

SoundFile miCancion;
Amplitude elVolumen; //analizador de amplitud

//variables para guardar lso valores de amplitud
float volSuavizado;
float vol;


void setup() {
  size(500, 500);

  //miCancion = new SoundFile(this, "plantasia.wav");
  miCancion = new SoundFile(this, "papaya.wav");
  elVolumen = new Amplitude(this); //cargar el analizador de Amplitud

  //conecta la canción con el analizador de amplitud
  elVolumen.input(miCancion);

  // reproduce
  miCancion.cue(0);
  miCancion.play();

  //reproduce en bucle
  //miCancion.loop();
}

void draw() {
  background(225, 255, 255);
  fill(0, 70, 90);


  //Obtener la amplitud actual e imprimirla en la consola
  vol = elVolumen.analyze();
  println(vol);

  //hace un suavizado entre el volumen anterior y el volumen actual
  //suavizado puede estar entre 0 y 1
  volSuavizado = lerp(volSuavizado, vol, 0.05);

  //map de valores de amplitud a pixeles en la pantalla
  float altura = map(volSuavizado, 0, 1, height - 10, 10);
  float tam = map(volSuavizado, 0, 1, 10, 100);

  ellipse(width/2, altura, tam, tam);
}

void mousePressed() {
  if (miCancion.isPlaying() == true) {
    miCancion.stop();
  } else {
    miCancion.play();
  }
}
