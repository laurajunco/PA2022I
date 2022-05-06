//crear la variable de la tabla
Table datos;

int x, y, tiempo;
int numFilas;

void setup() {
  size(400, 400);

  //cargar los datos a nuestra variable
  datos = loadTable("clicks.csv", "header");
}

void draw() {
  background(255);

  //obtener el numero de filas de la tabla
  numFilas = datos.getRowCount();

  //Recorrer cada una de las filas
  for (int i = 0; i < numFilas; i++) {

    //guardamos los datos de la fila en una variable
    TableRow filaActual = datos.getRow(i);

    //obtenemos los datos de cada columna
    x = filaActual.getInt("mousex");
    y = filaActual.getInt("mousey");
    tiempo = filaActual.getInt("tiempo");

    //dibuja un texto con el tiempo de cada click
    fill(0);
    text(tiempo, x, y);
  }
}

//cada vez que se presiona el mouse
void mousePressed() {
  //guardamos el tiempo actual en una variable
  int segundosActuales = int(millis()/1000);
  
  //creamos una nueva fila vacia en la tabla
  TableRow nuevoTiempo = datos.addRow();

  //Guardamos los valores en cada una de las columnas
  nuevoTiempo.setInt("mousex", mouseX);
  nuevoTiempo.setInt("mousey", mouseY);
  nuevoTiempo.setInt("tiempo", segundosActuales);

  //si hay mas de 10 filas elimina la primera
  if (numFilas > 10) {
    datos.removeRow(0);
  }

  //Guarda los datos de la tabla en el archivo
  saveTable(datos, "data/clicks.csv");

  //vuelve a cargar la tabla con los datos actualizados
  datos = loadTable("clicks.csv", "header");
}
