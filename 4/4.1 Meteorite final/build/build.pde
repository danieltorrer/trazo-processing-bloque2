// Exportar a pdf
import processing.pdf.*;

// Variables globales
// Variable para la imagen
PShape baseMap;

// Tabla donde guardaremos los datos del svg
Table tabla;

// Crearemos una nueva fuente
PFont f;



void setup() {
  // tamaño del canvas
  size(900, 450);

  // no se repetira la funcion loop
  noLoop();

  // Opcional: Imprimir una lista de las fuentes del sistema
  //printArray( PFont.list() );

  // Importamos una fuente predeterminada
  f = createFont("AvenirLTStd-Medium", 12);

  // Cargamos el svg
  baseMap = loadShape("WorldMap.svg");

  // Cargar csv
  tabla = loadTable("MeteorStrikes.csv", "header");
  // println(table.getRowCount() + " total filas en la tabla"); 

}


void draw() {
  //Guardar a PDF
  //beginRecord(PDF, "meteorStrikes.pdf");
  
  // mostrar mapa
  shape(baseMap, 0, 0, width, height);
  
  noStroke();

  //contador
  int i = 0;

  for (TableRow row : tabla.rows()) {

    //String nombre = row.getString("place");
    //println("nombre: "+nombre);

    fill(255, 0, 0, 50);
    // Renderear letras como texturas
    textMode(MODEL);

    noStroke();
    
    float longitud = row.getFloat("longitude");
    float latitud = row.getFloat("latitude");
    
    float graphLong = map( longitud, -180, 180, 0, width);
    float graphLat = map( latitud, 90, -90, 0, height);
    
    float tamano = row.getFloat("mass_g");

    float markerSize = 0.05*sqrt( tamano )/PI;
    ellipse(graphLong, graphLat, markerSize, markerSize);
    
    // controlamos que textos se despliegan y cuales no
    if(i<20) {
      fill(0);

      // llamamos al tipo de fuente
      textFont(f);

      // Desplegamos fuente en pantalla
      text( row.getString("place") , graphLong + markerSize + 5, graphLat + 4);
      noFill();
      stroke(0);
      line(graphLong+markerSize/2, graphLat, graphLong+markerSize, graphLat);
    }
    i++;
  }
  
  //endRecord();
  //println("PDF Saved!");
}