class Racecar {
  PVector pos, vel, acc;
  float r, maxS, maxF, lifeS;

  Racecar(PVector l) {
    pos = l;
    vel = new PVector(15,5);
    acc = new PVector(0,0);
    r = 18;
    maxS = 5;
    maxF = 10;
  }

  void update() {
    pos.add(vel);
    vel.add(acc);
    vel.limit(maxS);
    acc.mult(0);
    PVector mouse = new PVector(mouseX,mouseY);
    applyForce(new PVector(10,5));
  }
  void show() {
    float theta = vel.heading() + TWO_PI;
    noStroke();
    fill(255, 155, 98);
    pushMatrix();
    translate(pos.x, pos.y);
        rotate(theta);

    beginShape();
    vertex(r/2, 0);
    vertex(0, r);
    vertex(r, r);
    endShape(CLOSE);
    popMatrix();
  }
  void applyForce(PVector f) {
    f.normalize();
    f.mult(20);
    acc.add(f);
    acc.limit(maxF);
  }
  void borders() {
   if (pos.x > width) vel.x *= -1;
   if (pos.x < r) vel.x *= -1;
   if (pos.y > height) vel.y *= -1;
   if (pos.y < r) vel.y *= -1;
    
  }
}