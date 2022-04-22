class Jugador{
  int x;
  int y;
  int tam;
  
  //metdo constructor
  Jugador() {
    x = width/2;
    y = 550;
    tam = 20;
  }

  void mostrarse(){
    fill(255, 0, 0);
    noStroke();
    circle(x, y, tam);
  }
  
  void moverse(int mx, int my) {
    x = mx;
    y = my;
  }
  
  void crecer() {
    tam = tam + 3;
  }

}
