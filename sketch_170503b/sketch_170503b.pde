Vehicle v;

void setup() {
  size(600, 600);
  background(255);

  v = new Vehicle(new PVector(random(200, 400), random(200, 400)));
}

void draw() {
  v.update();
  v.show();
  v.border();
}