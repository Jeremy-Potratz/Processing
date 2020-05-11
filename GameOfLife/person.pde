class Person {
  float x;
  float y;
  float scl;
  boolean alive;
  float a, z;
  float index;
  color c;


  Person(float x, float y) {
    this.x = x;
    this.y = y;
    
  }

  void show(float z, float a, boolean alive) {
    this.z = z;
    this.a = a;
    this.alive = alive;
    if (alive) {
      fill(0, 0, 200);
    } else {
      fill(0, 200, 0);
    }
    rect(z, a, 20, 20);
  }
  
void getType(){
   

  
}





  
}