import hype.*;
import hype.extended.layout.*;
import hype.extended.colorist.*;
import processing.pdf.*;


HDrawablePool pool, pool2, pool3, pool4, pool5;
HColorPool colors, colors2, colors3, colors4, colors5;

void setup(){
  size(600, 600);
  
  H.init(this).background(#625182);

  colors = new HColorPool(#6D8E9E,#9AA5A2,#A5B6B6);
  colors2 = new HColorPool(#C1CDCA,#DFE9E3);
  colors3 = new HColorPool(#FE5B7B,#FF738D);
  colors4 = new HColorPool(#FF8297,#FF899D);
  
  pool = new HDrawablePool(1000);

  pool2 = new HDrawablePool(50);
  pool3 = new HDrawablePool(400);
  pool4 = new HDrawablePool(1400);
  
  colors5 = new HColorPool(#625182,#6D8E9E,#9AA5A2,#A5B6B6,#C1CDCA,#DFE9E3,#FE5B7B,#FF738D,#FF8297,#FF899D);
  pool5 = new HDrawablePool(1500);
  pool5.autoAddToStage()

    .add(new HShape("svg1.svg"), 10)
    .add(new HShape("svg6.svg"), 10)
    .layout(
      new HGridLayout()
      .startX(25)
      .startY(25)
      .spacing(50, 50)
      .cols(30)
    )
    
    .onCreate( // Cuando se crea el SVG
      new HCallback() { // Llamar a
        public void run(Object obj) { // esta funcion
          HShape d = (HShape) obj;
          d
            .enableStyle(false)
            .strokeJoin(ROUND)
            .strokeCap(ROUND)
            .strokeWeight(1)
            .stroke(#ff3300)
            //.fill(#111111)
            //.size( (int) random(25, 125))
            .anchorAt(H.CENTER)
            .rotate( 90 * int(random(1,4) ) ) // rotacion
            //.loc( (int) random(width), (int) random(height))
          ;

          d.randomColors( colors5.fillOnly() );
        }
      }
    )
    .requestAll()
  ;
  
  
  pool.autoAddToStage()
    .add(new HShape("triangle.svg"))
    .add(new HShape("svg1.svg"))

    .layout(
      new HShapeLayout()
      .target(
        new HImage("hey.png")
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
            .size( (int)random(0, 20) )
          ;
          d.randomColors(colors.fillAndStroke());
        }
      }
    )
    .requestAll()
  ;

  pool2.autoAddToStage()
    .add(new HShape("svg6.svg"))

    .layout(
      new HShapeLayout()
      .target(
        new HImage("circulo.png")
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
            .size( (int)random(0, 60) )
          ;
          d.randomColors(colors2.fillAndStroke());
        }
      }
    )
    .requestAll()
  ;

  pool3.autoAddToStage()
    .add(new HShape("svg2.svg"))

    .layout(
      new HShapeLayout()
      .target(
        new HImage("t2.png")
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
            .size( (int)random(0, 60) )
          ;
          d.randomColors(colors3.fillAndStroke());
        }
      }
    )
    .requestAll()
  ;

  pool4.autoAddToStage()
    .add(new HShape("svg3.svg"))

    .layout(
      new HShapeLayout()
      .target(
        new HImage("t3.png")
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
            .size( (int)random(0, 10) )
          ;
          d.randomColors(colors4.fillAndStroke());
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