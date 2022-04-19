PImage img;

void setup() {
  size(58, 360);
  img = loadImage("nyan_vert.png");
  image(img, 0, 0);

  PrintWriter output = createWriter("kitten.txt"); 
  int s = img.width * img.height;
  String r_str = "const int r[" + s + "] PROGMEM= {";
  String g_str = "const int g[" + s + "] PROGMEM = {";
  String b_str = "const int b[" + s + "] PROGMEM = {";

  int cnt = 0;
  for ( int y=0; y<img.height; y++) {
    for ( int x=0; x<img.width; x++) {

      color c= img.get(x, y);

      //int r=(c>>16)&255;
      //int g=(c>>8)&255;
      //int b=c&255;

      //output.print( "{" + r+ "," + g +","+b+ "}," );

      int r=(c>>16)&255;
      int g=(c>>8)&255;
      int b=c&255;
      r_str += r + ",";
      g_str += g + ",";
      b_str += b + ",";

      cnt++;
    }
  }
  print( cnt );
  r_str = r_str.substring( 0, r_str.length()-1 );
  output.println( r_str + " };" );
  g_str = g_str.substring( 0, g_str.length()-1 );
  output.println( g_str + " };" );
  b_str = b_str.substring( 0, b_str.length()-1 );
  output.println( b_str + " };" );
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  exit();
}

void draw() {
}
