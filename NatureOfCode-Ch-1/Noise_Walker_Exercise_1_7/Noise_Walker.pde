class Walker {
  
  float x,y;
  float tx,ty;
  
  Walker(int a, int b) {
    x = a;
    y = b;
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
    int stepX = 5;
    int stepY = 5;
    x += map(noise(tx), 0, 1, -stepX, stepX);
    y += map(noise(ty), 0, 1, -stepY, stepY);
    
    tx += 0.01;
    ty += 0.01;
  }
}
