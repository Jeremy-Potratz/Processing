class Walker {
 int x;
 int y;
 
 Walker(int a, int b) {
  x = a/2;
  y = b/2;
 }
  
 void display() {
  stroke(0);
  point(x,y);
 }
  
 void step() {
  int choice = int(random(4));
  
  if (choice == 0){
    x++;
  }else if (choice == 1){
    x--;
  }else if (choice == 2){
    y++;
  }else{
    y--;
  }
 }
}
