import processing.sound.*;

SoundFile miCancion;

//creare fuente
PFont barlow;

float posicion;

void setup() {
  size(500, 500);
  noStroke();
  rectMode(CENTER);

  //primero createFont
  barlow = loadFont("BarlowCondensed-SemiBold-48.vlw");
  textFont(barlow);

  //cargar cancion
  miCancion = new SoundFile(this, "plantasia.wav");

  miCancion.cue(0);
  miCancion.play();
}

void draw() {
  background(255, 200, 200);
  noStroke();
  fill(255);

  fill(50, 50, 200);
  textSize(24);

  //escribir la duracion total de mi cancion
  text( "Duración: " + int(miCancion.duration()) + "s", 10, 30);

  //escribir la posicion actual de mi cancion
  text( "Posicion: " + int(miCancion.position()) + "s", 10, 60);

  posicion = miCancion.position();

  if (posicion <= 5) {
    fill(255);
    ellipse(width/2, height/2, 300, 300);
  } else if ( posicion > 5 && posicion <= 10) {
    noFill();
    stroke(255);
    strokeWeight(5);
    rect(width/2, height/2, 300, 300);
  } else if ( posicion > 10 && posicion <= 15) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(posicion);
    noFill();
    stroke(255);
    strokeWeight(5);
    rect(0, 0, 300, 300);
    popMatrix();
  }
}

void mousePressed() {
  if (miCancion.isPlaying() == true) {
    miCancion.stop(); //pausar cancion
  } else {
    miCancion.cue(posicion); //guardar posicion de la cancion
    miCancion.play(); //reproducir
  }
}
