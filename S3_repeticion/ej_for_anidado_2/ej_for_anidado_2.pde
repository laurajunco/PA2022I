//Ejemplo repetición anidada
//Pensamiento algorítmico 2022-I
//https://processing.org/reference/for.html

size(800, 800);
background (255);
stroke(255);

int ancho = 20; //el ancho de cada cuadrado
int anchoGrid = 100; //el ancho de cada grupo de cuadrados

//Pueden comentar y descomentar los dictintos comandos fill()
//para entender que se está pintando en cada ciclo

//fill(random(255), random(255), random(255));

//Determina la posición en x de cada grupo de cuadrados
for (int grupoY = 0; grupoY < height; grupoY +=anchoGrid) {
  //fill(random(255), random(255), random(255));

  //Determina la posición en y de cada grupo de cuadrados
  for (int grupoX = 0; grupoX < width; grupoX+=anchoGrid) {
    fill(random(255), random(255), random(255));

    //Determina la posición en y de cada cuadrado
    for (int rectY = 0; rectY < anchoGrid; rectY += ancho) {
      //fill(random(255), random(255), random(255));

      //Determina la posición en x de cada cuadrado
      for (int rectX = 0; rectX < anchoGrid; rectX += ancho) {
        //fill(random(255), random(255), random(255));
        rect(grupoX + rectX, grupoY + rectY, ancho, ancho);
      }
    }
  }
}
