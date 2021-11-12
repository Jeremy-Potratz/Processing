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
  
  void step(float step) {
    int rand = (int) random(2);
    
    if(rand == 0){
      x += step;
    }else{
      y+= step;
    }
  }
}
