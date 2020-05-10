class flowField {
  PVector[][] field; 
  int cols;
  int rows;
  int scl;

  flowField(int r) {
    scl = r;
    cols = width/scl;
    rows = height/scl;

    field = new PVector[cols][rows];
    create();
  }

  void create() {
    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        //float theta = noise(xoff,yoff);
        float theta = map(noise(xoff,yoff), 0, 1, 0, TWO_PI);
        //polar to cartesion for coorditaes of x and y
        field[i][j] = new PVector(cos(theta), sin(theta));
        yoff += 0.1;
      }
      xoff += 0.1;
    }
  }

  void display() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        drawVector(field[i][j], i * scl, j * scl, scl-2);
      }
    }
  }

  //renders vector object 'V' as arrow and position 'x,y'
  void drawVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    translate(x, y);
    stroke(0);   
    rotate(v.heading());
    float len = v.mag() * scayl;
    line(0, 0, len, 0);
    popMatrix();
  }

  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/scl, 0, cols - 1));
    int row = int(constrain(lookup.y/scl, 0, rows - 1));
    return field[column][row].get();
  }
}