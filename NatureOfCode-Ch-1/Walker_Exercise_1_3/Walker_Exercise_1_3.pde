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
    
    int toMouse = (int)random(1);
    
    if (toMouse == 0){
      PVector point = new PVector(x,y);
      PVector mouse = new PVector(mouseX,mouseY);
      
      x += (point.sub(mouse)).x;
      y += (point.sub(mouse)).y;
      
    } else {
      int random = (int)random(3);
    if(random == 0) {
      x++;
    }else if (random == 1) {
      y++;
    }else if (random == 2) {
      x--;
    }else {
      y--;
    }
    
    } 
    

  }
  
}
