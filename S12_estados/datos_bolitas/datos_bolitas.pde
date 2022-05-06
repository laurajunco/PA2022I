//crear la variable de la tabla
Table datos;

int x, y;
float radio;
int numFilas;

void setup() {
  size(400, 400);

  //cargar los datos a nuestra variable
  datos = loadTable("bolitas.csv", "header");
}

void draw() {
  background(255);

  //obtener el numero de filas de la tabla
  numFilas = datos.getRowCount();

  //Recorrer cada una de las filas
  for (int i = 0; i < numFilas; i++) {

    //guardamos los datos de la fila en una variable
    TableRow bolitaActual = datos.getRow(i);

    //obtenemos los datos de cada columna
    x = bolitaActual.getInt("x");
    y = bolitaActual.getInt("y");
    radio = bolitaActual.getFloat("radio");

    //dibuja una elipse con los datos de la fila
    circle(x, y, radio);
  }
}

//cada vez que se presiona el mouse
void mousePressed() {

  //creamos una nueva fila vacia en la tabla
  TableRow nuevaBolita = datos.addRow();

  //Guardamos los valores en cada una de las columnas
  nuevaBolita.setInt("x", mouseX);
  nuevaBolita.setInt("y", mouseY);
  nuevaBolita.setFloat("radio", random(50));

  //si hay mas de 10 filas elimina la primera
  if (numFilas > 10) {
    datos.removeRow(0);
  }

  //Guarda los datos de la tabla en el archivo
  saveTable(datos, "data/bolitas.csv");

  //vuelve a cargar la tabla con los datos actualizados
  datos = loadTable("bolitas.csv", "header");
}
