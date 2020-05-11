Racecar r;


void setup() {
 size(500,500);
  r= new Racecar(new PVector(200,200));
}

void draw(){
   background(255);
      r.borders();

    r.update();
    r.show();

  
}

//idea- galaxy model with moon and stars with hue and galaxies