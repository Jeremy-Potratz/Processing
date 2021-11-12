import java.util.Random;

Random generator;

void setup() {
  size(640,360);
  generator = new Random();
}

void draw() {
  float numX = (float) generator.nextGaussian();
  float numY = (float) generator.nextGaussian();
  float numColor = (float) generator.nextGaussian();

  float sd = 60;
  float colorSD = 70;
  float meanColor = 255;
  float meanX = 320;
  float meanY = 180;
  
  float x = sd * numX + meanX;
  float y = sd * numY + meanY;
  float myColor = colorSD * numColor + meanColor;
  
  noStroke();
  fill(myColor,10);
  ellipse(x,y,16,16);
}
