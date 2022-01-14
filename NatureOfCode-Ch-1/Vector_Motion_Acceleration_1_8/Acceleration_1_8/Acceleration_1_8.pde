Mover M;
float t = 0;

void setup() {
  size(400,400);
  // Third argument is typeFlag for the type of mover 0- normal, 1- key based, 2 perlin noise based
  M = new Mover(400,400,2,10);
  background(255);
}

void draw() {
  background(255);
  //any number inside update only matters for type 2 - perlin noise, any other type doesn't use the input
  float n = noise(t);
  M.update(n);
  M.display();
  M.checkEdges();
}

void keyPressed() {
  if(keyCode == DOWN){
    M.update(1);
  }
  if(keyCode == UP){
    M.update(0);
  }
}
