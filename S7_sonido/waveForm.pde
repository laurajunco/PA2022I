import processing.sound.*;

SoundFile miCancion;
Waveform waveform;

//int muestras = 500;
int muestras = 360;
float[] sumAmp;


void setup() {
  size(800, 800);
  noStroke();
  rectMode(CENTER);
  //frameRate(20);

  miCancion = new SoundFile(this, "papaya.wav");
  waveform = new Waveform(this, muestras);
  waveform.input(miCancion);

  miCancion.cue(50);
  miCancion.play();
  miCancion.amp(0.2);
  
  sumAmp = new float[muestras];
}
void draw() {
  fill(255, 250, 250);
  rect(width/2, height/2, width + 5, height + 5);

  strokeWeight(1);
  noFill();

  waveform.analyze();
  
  beginShape();
    stroke(255, 0, 0);
  for (int i = 0; i < muestras; i++) {
    float x = map(i, 0, muestras, 0, width);
    float y = map(waveform.data[i], -1, 1, 0, height);

    vertex(x, y);
  }
  endShape();
  
  translate(width/2, height/2);
  for (int i = 0; i < muestras; i++) { 
    sumAmp[i] = lerp(sumAmp[i], waveform.data[i], 0.5);
    float alto = map(sumAmp[i], -1, 1, 0, height - 50);
    //float alto = map(waveform.data[i], -1, 1, 0, height - 50);
    float x = cos(radians(i)) * alto;
    float y = sin(radians(i)) * alto;
    stroke(255, 0, 0);
    line(0, 0, x, y);
  }
  
  
 
}

void mousePressed() {
  if (miCancion.isPlaying() == true) {
    miCancion.stop();
  } else {
    miCancion.play();
  }
}
