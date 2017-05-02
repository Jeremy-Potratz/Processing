ArrayList<Cell> cells = new ArrayList<Cell>();
Cell c = new Cell();

void setup() {
  background(200);
  size(600, 600);

  cells.add(c);

  c.makeCell();  

  for (int i = 0; i < 200; i ++) {
    Cell newCell = new Cell();
    newCell.makeCell();
  }
}

void keyPressed() {

  if (keyCode == UP) {

    c.setDir(10, "UP");
    println("bb"); 
  }
}

void draw() {
  c.move();
}