//Ejemplo repetición anidada
//Pensamiento algorítmico 2022-I
//https://processing.org/reference/for.html

size(850, 850);
background (255);

//ancho de los cuadrados
int ancho = 50; 
//espacio entre cuadrados es 2 veces el ancho
int espacio = ancho * 2; 

//tambien podemos definir el color con código hexadecimal
fill(#F2D24E); 
noStroke();

//el primer for dibuja en el eje y (columnas)
for(int y = 0; y <= width; y += espacio){
  
  //el segundo for dibuja en el eje x (filas)
  for (int x = 0; x <= height ; x += espacio) { 
    rect(x, y, ancho, ancho);
  }
}
