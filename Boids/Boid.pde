class Boid {

  PVector position;
  PVector velocity;
  PVector addV;
  PVector v1, v2, v3;
  float size;
  Boid[] boids;
  Float maxSpeed = 4f;
  Float maxForce = 0.06;

  Boid(float x, float y, float size) {
    position = new PVector(x, y);
    addV = new PVector(0, 0);
    float angle = random(TWO_PI);
    velocity = new PVector(cos(angle), sin(angle));
    this.size = size;
  }

  void fly(Boid[] flock) {
    //ok now we can use flock to tell all the stuff
    boids = flock;
    move();
    borders();
    display();
  }

  void borders() {
    if (position.x < -size) position.x = width+size;
    if (position.y < -size) position.y = height+size;
    if (position.x > width+size) position.x = -size;
    if (position.y > height+size) position.y = -size;
  }

  void display() {
    float theta = velocity.heading() + PI/2;
    fill(200, 100);
    stroke(255);
    //strokeWeight(1);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    beginShape();
    vertex(0, -size*2);
    vertex(-size, size*2);
    vertex(size, size*2);
    endShape(CLOSE);
    popMatrix();
  }

  void move() {
    //1. Seperation - stay a certain distance away from other boids
    //2. Alignment - align themselves to go the same way as surrounding boids
    //3. Cohesion - move with the surrounding boids

    this.addV.add(seperation().mult(1.5));
    this.addV.add(alignment());
    this.addV.add(cohesion());
    this.velocity.add(addV);
    this.velocity.limit(maxSpeed);
    this.position.add(velocity);
    this.addV.mult(0);
  }

  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, position);  // A vector pointing from the position to the target

    desired.normalize();
    desired.mult(maxSpeed);

    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);  // Limit to maximum steering force
    return steer;
  }

  PVector seperation() {
    PVector ryan = new PVector(0, 0);
    int count = 0;
    for (int i = 0; i < boids.length; i++) {
      Float d = dist(this.position.x, this.position.y, boids[i].position.x, boids[i].position.y);
      if (!boids[i].equals(this)) {
        if ((d > 0f) && (d < 50f)) {
          PVector sep = (PVector.sub(this.position, boids[i].position));
          sep.normalize();
          sep.div(d);
          ryan.add(sep);
          count++;
        }
      }
    }
    if (count > 0) {
      ryan.div((float)count);
      ryan.normalize();
      ryan.mult(maxSpeed);
      ryan.sub(this.velocity);
      ryan.limit(maxForce);
      return ryan;
    } else {
      return new PVector(0, 0);
    }
  }

  PVector alignment() {
    PVector ryan = new PVector(0, 0);
    int count = 0;
    for (int i = 0; i < boids.length; i++) {
      Float d = dist(this.position.x, this.position.y, boids[i].position.x, boids[i].position.y);
      if (!boids[i].equals(this)) {
        if ((d > 0f) && (d < 50f)) {
          ryan.add(boids[i].velocity);
          count++;
        }
      }
    }

    if (count > 0) {
      ryan.div((float)count);
      ryan.normalize();
      ryan.mult(maxSpeed);
      PVector f = PVector.sub(ryan, this.velocity);
      f.limit(maxForce);
      return f;
    } else {
      return new PVector(0, 0);
    }
  }
  PVector cohesion() {
    //Ryan is the "temp" in The Office, hehe, get it? B)
    PVector ryan = new PVector(0, 0);
    int count = 0;
    for (int i = 0; i < boids.length; i++) {
      if (!boids[i].equals(this)) {
        Float d = dist(this.position.x, this.position.y, boids[i].position.x, boids[i].position.y);
        if ((d > 0f) && (d < 50f)) {
          ryan.add(boids[i].position);
          count++;
        }
      }
    }

    if (count > 0) {
      ryan.div((float)count);

      return seek(ryan);
    } else {
      return new PVector(0, 0);
    }
  }
}
