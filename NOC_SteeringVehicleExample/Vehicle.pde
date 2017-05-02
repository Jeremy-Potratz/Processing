class Vehicle {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxForce;
  float maxSpeed;

  Vehicle(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, -2);
    position = new PVector(x, y);
    r = 3;
    maxSpeed = 40;
    maxForce = 0.1;
  }
  void update() {
    //update velocity
    velocity.add(acceleration);
    //limit velocity
    velocity.limit(maxSpeed);
    //add velocity to position
    position.add(velocity);
    //reset acceleration to 0
    acceleration.mult(0);
  }
  void applyForce(PVector force) {
    //could do mass here  F = MA
    acceleration.add(force);
  }
  //method to calc steering toward a target
  //Steer = desired - velocity
  void seek(PVector target) {
    //desired = position pointing at target
    PVector desired = PVector.sub(target, position);
    //set max speed
    desired.setMag(maxSpeed);
    //STEER = Desired - Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }
  void display() {
    float theta = velocity.heading2D() + PI/2;
    fill(255,255,0);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
}