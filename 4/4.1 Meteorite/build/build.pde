//https://github.com/danieltorrer/trazo-processing-bloque2
// Exportar a pdf
import processing.pdf.*;

PShape mapa;
PFont fuente;

//
Table tabla;

void setup() {
  // tamaño del canvas
  size(900, 450);
  //Imprime una lista de elementos
  //printArray( PFont.list() ); //PFont.list() regresa las fuentes disponibles en el sistema
  //                  nombre de la fuente, tamaño
  fuente = createFont("CircularStd-Bold", 12);
  // no se repetira la funcion loop
  noLoop();
   
  //carga el svg en la variable
  mapa = loadShape("WorldMap.svg");
  
  //Cargar CVS
  tabla = loadTable("MeteorStrikes.csv", "header");

}


void draw() {
  beginRecord(PDF, "meteor.pdf");
  
  shape(mapa, 0, 0, width, height);
  //Para cada fila, haz X
  
  int contador = 0;
  for( TableRow row : tabla.rows() ){
    
     float longitud = row.getFloat("longitude");
     float latitud = row.getFloat("latitude");
     
     float pixelLong = map( longitud, -180, 180, 0, width );
     float pixelLat = map( latitud, 90, -90, 0, height );
     
     float tamano = row.getFloat("mass_g");
     float marcador =  0.05 * sqrt(tamano) / PI;
   
     noStroke();
     fill(234, 27, 155, 50);
     ellipse(pixelLong, pixelLat, marcador, marcador);
     
     //si esta dentro de los 10 primeros
     if( contador < 10){
       fill(#000000);
       String nombre = row.getString("place");
       textFont(fuente);
       text( nombre, pixelLong + marcador + 5, pixelLat + 5 );
       stroke(#000000);
       line( pixelLong + marcador / 2, pixelLat, pixelLong + marcador, pixelLat );
       
     }
     // Codigo
     // Dibuja texto
     
     // Si no
     // no hagas nada
      
      //Suma uno a la variable
     contador++;
  }
  
  endRecord();
}