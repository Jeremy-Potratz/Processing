import java.util.Random;

Random generator;
Walker w;

void setup() {
  size(640,360);
  generator = new Random();
  w = new Walker(width/2, height/2);
  background(255);
}

void draw() {
  float numX = (float) generator.nextGaussian();
    
  float sd = 10;
  float mean = 0;
  
  float x = sd * numX + mean;
  
  w.display();
  w.step(x);
}
