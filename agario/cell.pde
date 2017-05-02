class Cell {

  float x, y, r;
  float a, xChange, yChange;
  String dir;

Cell(){
 this.x = 30;
 this.y = 30;
 this.r = 30;
}

  void makeCell() {
    this.x = x;
    this.y = y;
    this.r = r;
    
    noStroke();
    fill(10,10,244);
    ellipse(x,y,r,r);
  }
  
  void move(){
   this.x = xChange;
   this.y = yChange;
  }
  
 
    
    
   
  
  void setDir(float a, String dir){
    this.a = a;
    this.dir = dir;
    this.xChange = x;
    this.yChange = y;
    
    if (dir == "RIGHT"){
      
      this.xChange += a;
      
    }else if (dir == "DOWN") {
      
      this.yChange -= a;
      
    }else if (dir == "LEFT") {
      
      this.xChange -= a;
      
    }else{
      
      this.yChange += a;
    }
    
    
  }
  
}