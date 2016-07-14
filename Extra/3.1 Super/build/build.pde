void setup() {
  size(500, 500);
  noFill();
  stroke(#ffffff);
  strokeWeight(2);
}

void draw() {
  background(#000000);

  translate(width/2, height/2);

  beginShape();
  
  for (float theta = 0; theta <= 2 * PI; theta += 0.1) {
    float rad = r(theta,
      1, // a
      1, // b
      0, // m
      1, // n1
      1, // n2
      1  // n3
    );
    float x = rad * cos(theta) * 50;
    float y = rad * sin(theta) * 50;
    vertex(x, y);
  }

  endShape();
}

float r(float theta, float a, float b, float m, float n1, float n2, float n3){
  //first chunk
  float firstChunk = pow( abs (cos( m * theta / 4.0) / a ), n2);
  float secondChunk = pow( abs (sin( m * theta / 4.0) / b ), n3);

  return pow ( firstChunk + secondChunk, -1.0/n1 );
}