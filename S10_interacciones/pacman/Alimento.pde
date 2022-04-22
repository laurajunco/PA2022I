class Alimento {
  float x;
  float y;
  boolean visible;
  
  Alimento() {
    x = random(width);
    y = random(height);
    visible = true;
  }

  void mostrarse() {
    if(visible == true) {
      fill(0, 255, 0);
      circle(x, y, 5);
    }
  }
  
  void revisarDistancia(Jugador j){
    float distancia = dist(x, y, j.x, j.y);
    
    if(distancia < j.tam && visible == true) {
      visible = false;
      j.crecer();
      //desencadenamos todas las acciones
      //aumentar el puntaje
      //temrinar el juego
      //cambiar de nivel si se cumple x puntos
    }
  }

}
