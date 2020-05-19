Boid[] flock = new Boid[150];

void setup() {
  size(900, 700);
  for (int i = 0; i < flock.length; i++) {
    flock[i] = new Boid(random(width), random(height), 3);
  }
}

void draw() {
  //updates
  background(50);
  for (int i = 0; i < flock.length; i++) {
    flock[i].fly(flock);
  }
}
