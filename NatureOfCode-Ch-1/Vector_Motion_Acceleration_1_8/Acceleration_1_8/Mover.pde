class Mover {
  
  PVector location, velocity, acceleration;
  float topSpeed;
  float w, h;
  int typeFlag;
  
  void update(float breakFlag) {
    
      if(typeFlag == 0){
       velocity.add(acceleration);
       velocity.limit(topSpeed);
       location.add(velocity);
      }else if(typeFlag == 1){
        if(breakFlag == 0){
         //normal accelerate
       velocity.add(acceleration);
       velocity.limit(topSpeed);
       location.add(velocity);
        }else{
         //deccelerate 
       velocity.sub(acceleration);
       velocity.limit(topSpeed);
       location.add(velocity);
        }
      } else if(typeFlag == 2) {
        acceleration = PVector.random2D();
        acceleration.mult(random(breakFlag));
       velocity.add(acceleration);
       velocity.limit(topSpeed);
       location.add(velocity);
      }
     
  }
  
  Mover(float w1, float h1, int flag, float ts) {
    w = w1;
    h = h1;
    typeFlag = flag;
    location = new PVector(w/2, h/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(-0.001, 0.01);
    topSpeed = ts;
  }
  
  void display() {
    stroke(0);
    ellipse(location.x,location.y,10,10);
  }
  
  void checkEdges() {
    if(location.x > w) location.x = 0;
    if(location.x < 0) location.x = w;
    if(location.y > h) location.y = 0;
    if(location.y < 0) location.y = h;
  }
  
}
