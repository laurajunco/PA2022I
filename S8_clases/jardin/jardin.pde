Enjambre lasAbejas;
Abeja juanita;
Abeja carlos;

void setup() {
  size(600, 600);
  background(255);

  //crear abejas individualmente
  juanita = new Abeja(100, 200, color(255, 150, 150));
  carlos = new Abeja(300, 400, color(100, 250, 250));

  //crear enjambre de abejas
  lasAbejas = new Enjambre(50);
  lasAbejas.crearAbejas();
}

void draw() {
  background(255);

  //dibujar y mover abejas individualmente
  carlos.dibujarse();
  juanita.dibujarse();

  carlos.volar();
  juanita.volar();

  //dibujar y mover enjambre
  lasAbejas.dibujar();
  lasAbejas.volar();
}

//podemos preguntar por las caracteristicas de una abeja
void mousePressed() {
  if (juanita.estaMuerta == false) {
    juanita.morir();
  } else {
    juanita.revivir();
  }
}
