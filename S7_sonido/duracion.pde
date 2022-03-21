import processing.sound.*;

SoundFile miCancion; //variable para guardar la cancion
PFont miFuente; //variable para guardar la tipografia
float posicion; //Posicion de la cancion en segundos
float duracion; //Duracion de la cancion en segundos

void setup() {
  size(500, 500);
  noStroke();
  rectMode(CENTER);

  miCancion = new SoundFile(this, "plantasia.wav"); //cargar el archivo de la cancion
  miFuente = loadFont("FT88-Expanded-48.vlw"); //cargar el archivo de la tipografia

  //reproducir cancion
  miCancion.cue(0);
  miCancion.play();
}

void draw() {
  background(225, 255, 255);
  fill(0, 70, 90);
  
  //obtener duracion y posicion actual de la canción
  posicion = miCancion.position();
  duracion = miCancion.duration();
  
  //Establecer atributos del texto
  textFont(miFuente);
  textSize(20);
  
  //pintar texto
  text("Duración: " + int(duracion), 15, 30);
  text("Posicion: " + int(posicion), 15, 55);
  
  
  //dependiendo de la posicion de la canción se pinta algo diferente
  if(posicion >= 0 && posicion <= 5 ) {   
    rect(width/2, height/2, 200, 200);
  } else if(posicion > 5 && posicion <= 10) {
    ellipse(width/2, height/2, 200, 200);
  } else if(posicion > 10 && posicion <= 20) {
    pushMatrix();
      translate(width/2, height/2);
      rotate(radians(frameCount));
      rect(0, 0, 200, 200);
    popMatrix();
  } else {
    miCancion.stop();
    textSize(17);
    text("click para reiniciar", 10, height/2);
  }
  
  
}

void mousePressed() {
  if (miCancion.isPlaying() == true) {
    miCancion.stop();
  } else {
    miCancion.play();
  }
}
