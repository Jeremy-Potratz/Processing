class Vehicle {

  int r;
  PVector loci, vel, acc;
  float maxS, maxF;
  float lifeS;

  Vehicle(PVector l) {
    loci = l;
    vel = new PVector();
    acc = new PVector();
    r = 8;
    maxS = 10;
    maxF = 5;
    lifeS = 255;
  }
  void update() {

    loci.add(vel);
    vel.add(acc);
    vel.limit(maxS);
    acc.mult(0);

    applyForce(new PVector(random(-5, 5), random(-5, 5)));
  }

  void applyForce(PVector f) {
    acc.add(f);
    acc.limit(maxF);
  }

  void show() {
    noStroke();
    fill(lifeS, lifeS - 100, lifeS - 55);
    ellipse(loci.x, loci.y, r, r);
    lifeS += -1;
    if (lifeS == 0) lifeS = 255;
  }

  void border() {
    if (loci.x > width + r) loci.x = r;
    if (loci.x < r) loci.x = width + r;
    if (loci.y > height + r) loci.y = r;
    if (loci.y < r) loci.y = height + r;
  }
}