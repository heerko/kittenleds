PImage img;

void setup() {
  size(58, 360); // Sets the size of the window to be 58 pixels wide and 360 pixels tall.
  img = loadImage("nyan_vert.png"); // Load an image called "nyan_vert.png" and store it in the "img" object. Replace with your own filename
  image(img, 0, 0); 

  PrintWriter output = createWriter("kitten.txt"); // Create a new file called "kitten.txt" for writing.
  int s = img.width * img.height; // Calculate the size of the image in pixels.
  String r_str = "const int r[" + s + "] PROGMEM= {"; // Declare a string to hold the values of the red color channel.
  String g_str = "const int g[" + s + "] PROGMEM = {";// green
  String b_str = "const int b[" + s + "] PROGMEM = {";// blue

  int cnt = 0; // Counter variable to keep track of how many pixels have been processed.
  for (int y = 0; y < img.height; y++) { // Loop through each row of pixels in the image.
    for (int x = 0; x < img.width; x++) { // Loop through each column of pixels in the image.

      color c = img.get(x, y); // Get the color of the pixel at position (x, y).

      // Unpack the red, green, and blue color channels from the pixel color.
      int r = (c >> 16) & 255; // Shift the bits of the color value 16 bits to the right and mask out the first 8 bits to get the value of the red channel.
      int g = (c >> 8) & 255; // Shift the bits of the color value 8 bits to the right and mask out the first 8 bits to get the value of the green channel.
      int b = c & 255; // Mask out the first 8 bits to get the value of the blue channel.

      // Add the red, green, and blue color channel values to their respective strings, separated by commas.
      r_str += r + ",";
      g_str += g + ",";
      b_str += b + ",";

      cnt++; // Increment the counter.
    }
  }

  print(cnt); // Print the total number of pixels processed to the console.

  // Remove the trailing comma from each string and write them to the output file.
  r_str = r_str.substring(0, r_str.length() - 1);
  output.println(r_str + " };");
  g_str = g_str.substring(0, g_str.length() - 1);
  output.println(g_str + " };");
  b_str = b_str.substring(0, b_str.length() - 1);
  output.println(b_str + " };");

  output.flush(); // Writes the remaining data to the file.
  output.close(); // Close the output file.
  exit(); // Exit the program.
}

void draw() {
  // The draw() function is not used in this sketch.
}
