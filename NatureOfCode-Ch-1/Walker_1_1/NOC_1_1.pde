Walker w;

void setup() {
  size(640,360);
  w = new Walker(width, height);
  background(255);
}

void draw() {
  w.step();
  w.display();
}
