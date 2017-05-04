class Racecar {
  PVector pos, vel, acc;
  float r, maxS, maxF, lifeS;

  Racecar(PVector l) {
    pos = l;
    vel = new PVector();
    acc = new PVector();
    r = 18;
  }
  
  void update() {
    pos.add(vel);
    vel.add(acc);
    vel.limit(maxS);
    acc.mult(0);
    
    applyForce();
  }
  void show(){
    noStroke();
    fill(255,155,98);
    translate(pos.x,pos.y);
    beginShape();
    vertex(r/2, 0);
    vertex(0,r);
    vertex(r,r);
    endShape();
  }
  void applyForce(){
    
    
    
  }
  
  
}