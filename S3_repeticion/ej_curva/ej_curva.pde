//Ejemplo curvas
//Pensamiento algorítmico 2022-I
//https://processing.org/reference/bezier_.html
//https://processing.org/reference/curve_.html

size(1000, 1000); //lienzo
background(255); //fondo blanco

//Para ver como cambian las curvas 
//experimenten modificando las variables de
//puntos y puntos de control

//punto 1 curva
int p1x = 300;
int p1y = 500;

//punto 2 curva
int p2x = 700;
int p2y = 500;


//punto control 1
int c1x = 10;
int c1y = 10;

//punto control 2
int c2x = 990;
int c2y = 990;

//dibujar puntos
strokeWeight(10);
stroke(0);

//puntos de la curva
point(p1x, p1y);
point(p2x, p2y);

//puntos de control
point(c1x, c1y);
point(c2x, c2y);

//lineas
strokeWeight(2);
line(c1x, c1y, p1x, p1y); //linea de control 1
line(c2x, c2y, p2x, p2y); //linea de control 2

//curva normal
stroke(255, 0, 0);
curve(c1x, c1y, p1x, p1y, p2x, p2y, c2x, c2y);

//curva bezier
stroke(0, 255, 0);
bezier(p1x, p1y, c1x, c1y,c2x, c2y, p2x, p2y);
