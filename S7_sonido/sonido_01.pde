//importar libreria Sound
//asegurense de haber instalado la libreria
import processing.sound.*;

//crear variable para guardar mi cancion
SoundFile miCancion;

void setup() {
  size(500, 500);
  noStroke();
 
  //cargar la cancion
  //Se pueden utilizar formatos .wav, .mp3 y .aiff
  miCancion = new SoundFile(this, "plantasia.wav");

  //ir al segundo 45 de la cancion
  miCancion.cue(45);
  
  //reproducir canción
  miCancion.play();
}

void draw() {
  //volumen va de 0.0 a 1.0
  float miVolumen = map(mouseX, 0, width, 0.01, 1.0);
  float miColor = map(mouseX, 0, width, 0, 255);

  //establecemos la velocidad de 0.5 a 3.0
  float miVelocidad = map(mouseY, 0, height, 0.5, 3.0);

  background(miColor, 200, 200);

  fill(255);
  //con esta función los rectangulos se dibujan desde el centro
  rectMode(CENTER);
  rect(width/2, height/2, mouseX/2, mouseY/2);

  //cambiar volumen de la cancion
  miCancion.amp(miVolumen);

  //cambiar velocidad de la cancion
  miCancion.rate(miVelocidad);
}

//solo se ejecuta al hacer click
void mousePressed() {

  //preguntar si la canción se está reproduciendo
  if (miCancion.isPlaying() == true) {
    miCancion.stop(); //pausar cancion
  } else {
    miCancion.play(); //reproducir
  }
}
