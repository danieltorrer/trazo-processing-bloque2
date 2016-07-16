import hype.*;
import hype.extended.colorist.*;

HRect d;
HColorPool colors;

void setup() {
  size(600, 600);

  //Lienzo
  H.init(this).background(#202020);

  for (int i= 0; i < 100; i++) {
    d = new HRect();

    d
      .strokeWeight(1)
      .stroke(#000000)
      .fill( colors.getColor() )
      .size( (int) random(25, 125) )
      .rotate( (int) random(360) )
      .loc( (int) random(width), (int) random(height) )
      .anchorAt( H.CENTER );

    H.add(d);

  }

  H.drawStage();

}
