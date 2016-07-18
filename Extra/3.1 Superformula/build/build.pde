import processing.serial.*;

float tiempo = 0;

Serial myPort; // guardar el numero de puerto
String val;
int lados = 2;

void setup() {
  size(500, 500);
  noFill();
  stroke(#44F06D);
  strokeWeight(2);

  printArray(Serial.list());
  String portName = Serial.list()[4];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  if ( myPort.available() > 0 ) {
    val = myPort.readStringUntil('\n'); //valor
    if ( val != null) {
      val = val.trim();
    }
    println(val);
    
  }

  if ( val != null) {
    if( val.equals("S")){
      println("Guardando");
      saveFrame("export/###_imagen.jpg");
    }
    else{
      if ( val != "0" && val != "S") {
        lados = parseInt(val);
        lados = lados / 50;
      }
    }
    

    //println("lados:" + lados);
  }



  background(#F1F2D0);

  translate(width/2, height/2);

  beginShape();

  for (float theta = 0; theta <= 2 * PI; theta += 0.05) {
    float rad = r(theta, 
      mouseY / 100.0, // a
      2, // b
      lados, // m  //Lados
      mouseX /100.0, // n1
      sin(tiempo) * 0.5 + 1.2, // n2
      cos(tiempo) * 0.5 + 1.2// n3
      );
    float x = rad * cos(theta) * 50;
    float y = rad * sin(theta) * 50;
    vertex(x, y);
  }

  endShape();

  tiempo += 0.1;
}

float r(float theta, float a, float b, float m, float n1, float n2, float n3) {

  float firstChunk = pow( abs (cos( m * theta / 4.0) / a ), n2);
  float secondChunk = pow( abs (sin( m * theta / 4.0) / b ), n3);

  return pow ( firstChunk + secondChunk, -1.0/n1 );
}