import hype.*;
import hype.extended.layout.*;
import hype.extended.colorist.*;
import processing.pdf.*;


HDrawablePool pool;
HColorPool colors;

void setup(){
  size(600, 600);
  
  H.init(this).background(#202020);

  colors = new HColorPool(#002B4F,#00436B,#146A9C,#5D9ECD,#84B6D9,#A3CEE8,#BDE4F2,#CCEEFA,#DDFCF7);
  
  pool = new HDrawablePool(300);
  pool.autoAddToStage()
    .add(new HShape("triangle.svg"))

    .layout(
      new HShapeLayout()
      .target(
        new HImage("trazo.png")
      )
    )

    .onCreate(
      new HCallback() {
        public void run(Object obj) {
          HShape d = (HShape) obj;
          d
            .enableStyle(false)
            .noStroke()
            .anchorAt(H.CENTER)
            .rotate( int(random(0, 360)))
            .size( (int)random(0, 30) )
          ;
          d.randomColors(colors.fillAndStroke());
        }
      }
    )
    .requestAll()
  ;
  
}

void draw(){
  H.drawStage();
}

void keyReleased(){
  if(key == 's' || key == 'S'){
    saveFrame("frames/####_d4.jpg");
  }

  if(key == 'v' || key == 'V'){
    saveVector();
  }
}

void saveVector() {
  PGraphics tmp = null;
  tmp = beginRecord(PDF, "frames/render##.pdf");

  if (tmp == null) {
    H.drawStage();
  } else {
    H.stage().paintAll(tmp, false, 1); // PGraphics, uses3D, alpha
  }

  endRecord();
}