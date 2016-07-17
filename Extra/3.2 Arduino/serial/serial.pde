import processing.serial.*;

Serial myPort;
String val;

void setup(){
  size(300, 300);
  printArray(Serial.list());
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);
}

void draw(){
  if( myPort.available() > 0 ){
    val = myPort.readStringUntil('\n');
  }
  
  println(val);
}