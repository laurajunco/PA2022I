class Enjambre {

  //variables o información de una abeja
  int numAbejas;
  Abeja[] abejas; //un ejmabre tiene un arreglo de abejas

  //método constructor:
  //Inicializa el enjambre con la cantidad de abejas que le deicmos
  Enjambre(int num) {
    numAbejas = num;
    abejas = new Abeja[numAbejas];
  }

  /* funciones */

  //recorre nuestro arreglo de abejas y las inicializa
  void crearAbejas() {
    for (int i = 0; i < numAbejas; i++) {
      color colorAleatorio = color(random(255), random(255), random(255));
      abejas[i] = new Abeja(random(width), random(-300, 100), colorAleatorio );
    }
  }

  //recorre nuestro arreglo de abejas y las dibuja
  void dibujar() {
    for (int i = 0; i < numAbejas; i++) {
      abejas[i].dibujarse();
    }
  }

  //recorre nuestro arreglo de abejas y las mueve
  void volar() {
    for (int i = 0; i < numAbejas; i++) {
      abejas[i].volar();
    }
  }
}
