import hype.*;
import hype.extended.layout.HGridLayout;
import hype.extended.colorist.*;

HDrawablePool pool;
HColorPool colors;

void setup(){
  size(600,600);
  H.init(this).background(#202020);

  colors = new HColorPool(#625182,#6D8E9E,#9AA5A2,#A5B6B6,#C1CDCA,#DFE9E3,#FE5B7B,#FF738D,#FF8297,#FF899D);


  pool = new HDrawablePool(1500);
  pool.autoAddToStage()

    .add(new HShape("svg6.svg"), 10)
    
    .layout(
      new HGridLayout()
      .startX(25)
      .startY(25)
      .spacing(20, 20)
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

          d.randomColors( colors.fillOnly() );
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