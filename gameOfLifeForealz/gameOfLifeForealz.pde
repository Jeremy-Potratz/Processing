int scl = 20;
ArrayList<Person> people = new ArrayList<Person>();

ArrayList<Person> killList = new ArrayList<Person>();
ArrayList<Person> reviveList = new ArrayList<Person>();



Person[][] peopleArray; 
float[][] mouseArray;
float aliveCount;
boolean doCheck = false;

void setup() {
  background(0);
  size(800, 800);
  peopleArray = new Person[floor(height/scl)][floor(width/scl)];
  for (int y = 0; y < height/scl; y++) {
    for (int x = 0; x < width/scl; x++) {
      peopleArray[x][y] = new Person(x * scl, y * scl);
      peopleArray[x][y].show(x * scl, y * scl, false);
    }
  }
}

void mousePressed() {
  if (peopleArray[floor(mouseX/scl)][floor(mouseY/scl)].alive == true) {

    peopleArray[floor(mouseX/scl)][floor(mouseY/scl)].alive = false;
  } else {

    peopleArray[floor(mouseX/scl)][floor(mouseY/scl)].alive = true;
  }
}

void keyPressed() {
  if (keyCode == BACKSPACE) {
    for (int y = 0; y < height/scl; y++) {
      for (int x = 0; x < width/scl; x++) {
        peopleArray[x][y].alive = false;
      }
    }
    doCheck = false;
    frameRate(10);
  }

  if (keyCode == ENTER) {

    doCheck = true;
  }

  if (keyCode == DOWN) {
    doCheck = false;
    frameRate(10);
  }
}

void check() {

  for (int y = 1; y < height/scl; y++) {
    for (int x = 1; x < width/scl; x++) {


      if (peopleArray[x][y].alive) {
        if (peopleArray[x][y].x == 0 ||
          peopleArray[x][y].y == 0 || peopleArray[x][y].x / scl == (width/scl) -1 || peopleArray[x][y].y / scl == (height/scl) -1) {
        } else {

          for (int i = -1; i < 2; i++) {
            if (peopleArray[x][y + i].alive) {
              aliveCount++;
            }
            if (peopleArray[x - 1][y + i].alive) {
              aliveCount++;
            }
            if (peopleArray[x + 1][y + i].alive) {
              aliveCount++;
            }
          }
          if (aliveCount == 3 || aliveCount == 4) {
          } else {

            println(aliveCount);
            println(peopleArray[x][y].x);
            killList.add(peopleArray[x][y]);
          }

          aliveCount = 0;
        }
      }

      if (!peopleArray[x][y].alive) {

        if (peopleArray[x][y].x == 0 ||
          peopleArray[x][y].y == 0 || peopleArray[x][y].x / scl == (width/scl) -1 || peopleArray[x][y].y / scl == (height/scl) -1) {
        } else {
          for (int i = -1; i < 2; i++) {
            if (peopleArray[x][(y) + i].alive) {
              aliveCount++;
            }
            if (peopleArray[(x) - 1][(y) + i].alive) {
              aliveCount++;
            }
            if (peopleArray[(x) + 1][(y) + i].alive) {
              aliveCount++;
            }
          }
          if (aliveCount == 3) {
            reviveList.add(peopleArray[x][y]);
          } else {
          }

          aliveCount = 0;
        }
      }
    }
  }

  for (Person p : killList) {
    p.alive = false;
  }
  for (Person w : reviveList) {
    w.alive = true;
  }
  for (int i = killList.size() - 1; i >= 0; i--) {
    killList.remove(i);
  }  
  for (int i = reviveList.size() - 1; i >= 0; i--) {
    reviveList.remove(i);
  }
}

void draw() {
  for (int y = 0; y < height/scl; y++) {
    for (int x = 0; x < width/scl; x++) {
      peopleArray[x][y].show(x * scl, y * scl, peopleArray[x][y].alive);
    }
  }

  if (doCheck) {
    frameRate(4);
    check();
  }
}