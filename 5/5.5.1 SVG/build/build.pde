import hype.*;
import hype.extended.layout.HGridLayout;
import hype.extended.colorist.*;

HDrawablePool pool;
HColorPool colors;

PFont font1, font2, font3;  

void setup(){
  size(630,970);
  surface.setResizable(true);
  H.init(this).background(#202020);

  colors = new HColorPool(#0B9687, #479E7F, #ABF2BC, #A8D2A7, #5BCBC1);

  pool = new HDrawablePool(150);
  pool.autoAddToStage()
    .add(new HShape("svg1.svg"))
    //.add(new HShape("svg2.svg"))

    .layout(
      new HGridLayout()
      .startX(40)
      .startY(40)
      .spacing(60,60)
      .cols(10)
    )

    .onCreate(
      new HCallback() {
        public void run(Object obj) {
          HShape d = (HShape) obj;
          d
            .enableStyle(false)
            .noStroke()
            .anchorAt(H.CENTER)
            //.anchorAt(H.TOP | H.LEFT)
            .rotate( 90 * int(random(1,4) ) )
            //.scale(int( random(1, 3) ))
          ;
          d.randomColors(colors.fillOnly());
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
    saveFrame("frames/###.jpg");
  }
}