class Vehicle {

  float r;
  PVector position;
  PVector velocity;
  PVector acceleration;
  float maxF;
  float maxS;

  Vehicle(PVector l, float ms, float mf) {
    position = l.get();
    r = 3.0;
    maxS = ms;
    maxF = mf;
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
  }

  public void run() {
    update();
    borders();
    display();
  }

  void follow(flowField flow) {

    PVector desired = flow.lookup(position);
    desired.mult(maxS);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxF);
    applyForce(steer);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxS);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    float theta = velocity.heading() + (PI/2); 
    fill(177);
    stroke(0);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -r/2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
  }
  
   void borders() {
    if (position.x < -r) position.x = width+r;
    if (position.y < -r) position.y = height+r;
    if (position.x > width+r) position.x = -r;
    if (position.y > height+r) position.y = -r;
  }
}