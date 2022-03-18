import processing.sound.*;

SoundFile miCancion;
Amplitude miAmplitud;

void setup() {
  size(500, 500);
  noStroke();
  rectMode(CENTER);

  miCancion = new SoundFile(this, "plantasia.wav");
  miAmplitud = new Amplitude(this);
  miAmplitud.input(miCancion);

  miCancion.cue(50);
  miCancion.play();
}

void draw() {
  noStroke();
  fill(255, 200, 200, 40);
  rect(width/2, height/2, width, height);

  float tam = map(miAmplitud.analyze(), 0, 1, 50, 400);

  stroke(255);
  strokeWeight(5);
  fill(255, 50);
  ellipse(width/2, height/2, tam, tam);
}

void mousePressed() {
  if (miCancion.isPlaying() == true) {
    miCancion.stop();
  } else {
    miCancion.play();
  }
}
