class Star {

  int x, y, r;

  Star(int rr) {

    r = rr;
  }

  void show() {

    for (int i = 0; i < 14; i ++) {

      noStroke();
      fill(255);
      float randR = random(0, r);
      ellipse(random(0, width), random(0, height), randR, randR);
    }
  }

  void galaxy() {
  }



  void move() {
  }
}