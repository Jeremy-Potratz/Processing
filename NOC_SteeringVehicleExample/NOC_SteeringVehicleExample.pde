Vehicle[] v = new Vehicle[100];

void setup() {
  size(600, 600);
  //v = new Vehicle(width/2, height/2);
  for (int i = 0; i < v.length; i++) {
    v[i] = new Vehicle(random(width), random(height));
  }
}

void draw() {
  background(255);
  PVector mouse = new PVector(mouseX, mouseY);

  //ellipse at mouse
  fill(200);
  stroke(0);
  strokeWeight(0);
  ellipse(mouse.x, mouse.y, 48, 48);

  //call the appropriate steering behaviors for our agents
  for (int i = 0; i < v.length; i++) {
    v[i].seek(mouse);
    v[i].update();
    v[i].display();
  }
}