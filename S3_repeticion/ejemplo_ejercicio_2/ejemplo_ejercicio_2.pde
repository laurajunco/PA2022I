//Ejemplo ejercicio E3 repetición
//Pensamiento algorítmico 2022-I

size(500, 500);
noStroke();

// Para ver que conjunto se está dibujando reemplaza
//el color de relleno por otro color,
// por ejemplo rojo: fill(255, 0 ,0) esto hará visible
//que conjunto de cuadrantes
// se está dibujando

// 1st row white
for (int j=0; j<height; j=j+20) {
  for (int i=20; i<width; i=i+80) {
    fill(255);
    quad(i, j, i+20, j, i+40, j+20, i+20, j+20);
  }
  j=j+60;
}

// 1st row black
for (int j=0; j<height; j=j+20) {
  for (int i=-20; i<width; i=i+80) {
    fill(0);
    quad(i, j, i+20, j, i+40, j+20, i+20, j+20);
  }
  j=j+60;
}

// 2nd row while
for (int j=20; j<height; j=j+20) {
  for (int i=0; i<width; i=i+80) {
    fill(255);
    quad(i, j, i+20, j, i+40, j+20, i+20, j+20);
  }
  j=j+60;
}

// 2nd row black
for (int j=20; j<height; j=j+20) {
  for (int i=40; i<width; i=i+80) {
    fill(0);
    quad(i, j, i+20, j, i+40, j+20, i+20, j+20);
  }
  j=j+60;
}

// 3rd row white
for (int j=40; j<height; j=j+20) {
  for (int i=-20; i<width; i=i+80) {
    fill(255);
    quad(i, j, i+20, j, i+40, j+20, i+20, j+20);
  }
  j=j+60;
}

// 3rd row black
for (int j=40; j<height; j=j+20) {
  for (int i=20; i<width; i=i+80) {
    fill(0);
    quad(i, j, i+20, j, i+40, j+20, i+20, j+20);
  }
  j=j+60;
}

// 4th row white
for (int j=60; j<height; j=j+20) {
  for (int i=-40; i<width; i=i+80) {
    fill(255);
    quad(i, j, i+20, j, i+40, j+20, i+20, j+20);
  }
  j=j+60;
}

// 4th row black
for (int j=60; j<height; j=j+20) {
  for (int i=0; i<width; i=i+80) {
    fill(0);
    quad(i, j, i+20, j, i+40, j+20, i+20, j+20);
  }
  j=j+60;
}

// 0th row black vertical
for (int j=-20; j<height; j=j+20) {
  for (int i=-40; i<width; i=i+80) {
    fill(0);
    quad(i, j, i+20, j+20, i+20, j+40, i, j+20);
  }
  j=j+60;
}

// 1st row black vertical
for (int j=0; j<height; j=j+20) {
  for (int i=20; i<width; i=i+80) {
    fill(0);
    quad(i, j, i+20, j+20, i+20, j+40, i, j+20);
  }
  j=j+60;
}

// 2nd row black vertical
for (int j=40; j<height; j=j+20) {
  for (int i=-20; i<width; i=i+80) {
    fill(0);
    quad(i, j, i+20, j+20, i+20, j+40, i, j+20);
  }
  j=j+60;
}

// 3rd row black vertical
for (int j=20; j<height; j=j+20) {
  for (int i=0; i<width; i=i+80) {
    fill(0);
    quad(i, j, i+20, j+20, i+20, j+40, i, j+20);
  }
  j=j+60;
}

// 0th row white vertical
for (int j=-20; j<height; j=j+20) {
  for (int i=0; i<width; i=i+80) {
    fill(255);
    quad(i, j, i+20, j+20, i+20, j+40, i, j+20);
  }
  j=j+60;
}

// 1st row white vertical
for (int j=0; j<height; j=j+20) {
  for (int i=-20; i<width; i=i+80) {
    fill(255);
    quad(i, j, i+20, j+20, i+20, j+40, i, j+20);
  }
  j=j+60;
}

// 2nd row white vertical
for (int j=20; j<height; j=j+20) {
  for (int i=-40; i<width; i=i+80) {
    fill(255);
    quad(i, j, i+20, j+20, i+20, j+40, i, j+20);
  }
  j=j+60;
}

// 3rd row white vertical
for (int j=40; j<height; j=j+20) {
  for (int i=20; i<width; i=i+80) {
    fill(255);
    quad(i, j, i+20, j+20, i+20, j+40, i, j+20);
  }
  j=j+60;
}
