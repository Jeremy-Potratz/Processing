float scale = 10;


void setup() {
  size(1000, 1000);
  background(255);


  for (int i = 0; i < width/scale; i++) {
    for (int j = 0; j < height/scale; j++) {
      stroke(255,0,255);
      //line(random(i*scale, i * scale + 10), random(j*scale, j * scale + 10), random(i*scale, i * scale + 10), random(j*scale, j * scale + 10));
      line(noise(i * scale),noise(j * scale), noise(i * scale + 10), noise(j * scale + 10));
    }
  }
}

void draw() {
}