class Alimento {
  float x;
  float y;
  boolean invisible;

  Alimento() {
    x = random(width);
    y = random(height);
    invisible = false;
  }

  void mostrarse() {
    if (invisible == false) {
      fill(0);
      circle(x, y, 5);
    }
  }

  void desaparecer() {
    invisible = true;
  }
  
  void reestablecer() {
    invisible = false;
    x = random(width);
    y = random(height);
  }

  boolean revisarDistancia(Jugador j) {
    float dist = dist(x, y, j.x, j.y);

    if (dist < j.tam/2 && invisible != true) {
      desaparecer();
      j.crecer();
      return true;
    } else {
      return false;
    }
  }
}
