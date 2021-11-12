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
    
    int toMouse = (int)random(2); //<>//
    
    if (toMouse == 0){
      PVector point = new PVector(x,y);
      PVector mouse = new PVector(mouseX,mouseY);
      
      if(point.x - mouse.x > 0){
       x--; 
      }
      if(point.x - mouse.x < 0){
       x++; 
      }
      if (point.y - mouse.y > 0){
       y--; 
      }
      if (point.y - mouse.y < 0){
       y++;
      }
      
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
