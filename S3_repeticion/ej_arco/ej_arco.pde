//Ejempo arco 
//Pensamiento algorítmico 2022-I
//https://processing.org/reference/arc_.html

size(800, 800); //crear un lienzo
background(255); //color de fondo del lienzo

/* --- ARCO 1 ---*/
//elipse de referencia
strokeWeight(1);
stroke(200);
noFill();
ellipse(600, 200, 600, 600);

//arco
strokeWeight(3);
fill(243, 255, 121);
stroke(0);
arc(600, 200, 600, 600, radians(90), radians(180), OPEN);

/* --- ARCO 2 ---*/
//elipse de referencia
strokeWeight(1);
stroke(200);
noFill();
ellipse(250, 450, 600, 600);

//arco
strokeWeight(3);
fill(145, 121, 255);
stroke(0);
arc(250, 450, 600, 600, radians(270), radians(360), OPEN);
