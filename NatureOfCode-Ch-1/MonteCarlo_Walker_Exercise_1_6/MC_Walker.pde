class Walker {
  
  int x;
  int y;
  
  Walker(int a, int b) {
    x = a;
    y = b;
  }
  
  void display() {
    stroke(0);
    point(x,y);
  }
  
  void step() {
    
    float stepSize = random(0,10);
    float qualifier = random(0,10);
    
    if(qualifier < stepSize){
    
     float stepx = random(-stepSize,stepSize);
     float stepy = random(-stepSize,stepSize);
    
     x+= stepx;
     y+= stepy;
    }else{
      step();
    }
  }
  
}
