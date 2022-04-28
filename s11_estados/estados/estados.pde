//Estados
int INICIO = 1;
int MENU = 2;
int NIVEL1 = 3;
int PERDER = 4;
int GANAR = 5;

//guarda el estado en el que estamos
int estadoActual;


void setup(){
  size(400, 400);
  background(255);
  
  //definir el estado inicial del juego
  estadoActual = INICIO;
  textSize(30);
}

void draw() {
  if (estadoActual == INICIO) {
    //aqui deberia pasar todo lo que pasa en el inicio
    background(255, 0, 0);
    text("INICIO", width/2, height/2);
  } 
  
  if (estadoActual == MENU) {
    //aqui deberia pasar todo lo que pasa en el menu
    background(0, 255, 0);
    text("MENU", width/2, height/2);
  } 
  
  if (estadoActual == NIVEL1) {
    //aqui deberia pasar todo lo que pasa en el menu
    background(0, 0, 255);
    text("NIVEL1", width/2, height/2);
  } 
  
  if (estadoActual == PERDER) {
    //aqui deberia pasar todo lo que pasa en el menu
    background(0, 255, 255);
    text("PERDER", width/2, height/2);
  }
  
  if (estadoActual == GANAR) {
    //aqui deberia pasar todo lo que pasa en el menu
    background(255, 0, 255);
    text("GANO", width/2, height/2);
  }
}

void mouseReleased() {
  //cambiar de nivel cuando oprimo el mouse
  if(estadoActual == INICIO) {
    estadoActual = MENU;
  } else if(estadoActual == MENU) {
    estadoActual = NIVEL1;
  } else if(estadoActual == NIVEL1) {
    
    if(mouseButton == LEFT) {
      estadoActual = GANAR;
    } else if(mouseButton == RIGHT) {
      estadoActual = PERDER;
    }
    
  } else if(estadoActual == GANAR) {
    estadoActual = INICIO;
  }
}
