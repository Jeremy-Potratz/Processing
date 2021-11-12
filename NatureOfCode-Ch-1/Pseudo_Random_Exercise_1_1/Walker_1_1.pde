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
    
    int random = (int)random(11);
    
    if(random >= 0 && random <= 3) {
      x++;
    }else if (random >= 4 && random <= 7) {
      y++;
    }else if (random >= 8 && random <= 9) {
      x--;
    }else {
      y--;
    }
    
  }
  
}
