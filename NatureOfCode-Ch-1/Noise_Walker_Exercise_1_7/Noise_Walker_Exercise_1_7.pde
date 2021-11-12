Walker w;

void setup() {
  size(640, 360);
  w = new Walker(width/2, height/2);
  background(255);
}

void draw() {
  //Step first to avoid the first circle that does not follow noise pattern
  w.step();
  w.display();
}
