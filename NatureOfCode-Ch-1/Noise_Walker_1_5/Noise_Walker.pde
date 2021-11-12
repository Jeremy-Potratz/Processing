class Walker {
  
  float x,y;
  float tx,ty;
  
  Walker(int a, int b) {
    tx = 0;
    ty = 10000;
  }
  
  void display() {
    stroke(0);
    ellipse(x,y,10,10);
  }
  
  void step() {
    //Below maps the value of noise ([0 ... 1]) to our desired values for steps
    //tx and ty are seed values
    x = map(noise(tx), 0, 1, 0, width);
    y = map(noise(ty), 0, 1, 0, height);
    
    tx += 0.01;
    ty += 0.01;
  }
}
