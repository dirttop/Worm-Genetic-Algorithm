class Worm implements Comparable<Worm> {
  int x, y, speed;
  DNA dna;
  float fitness, d1, d2;
  int d;
  color c;

  Worm() {
    x = 250;
    y = 150;
    speed = 25;
    c = 255;

    dna = new DNA();
  }

  PVector getLocation() {
    return new PVector(x, y);
  }

  void display() {
    fill(c);
    stroke(82, 54, 27);
    ellipse(x, y, d1, d2);
  }

//movement is based on the genetic code
  void move(int d) {
    if (d == 0) {
      y = y + speed;
      d1 = 5;
      d2 = 15;
      //println("down");
    }
    if (d == 1) {
      x = x - speed;
      d1 = 15;
      d2 = 5;
      //println("left");
    }
    if (d == 2) {
      x = x + speed;
      //println("right");
      d1 = 15;
      d2 = 5;
    }
    if (d == 3 && y > 150) {
      y = y - speed;
      d1 = 5;
      d2 = 15;
      //println("up");
    }
    //else {
    //  y = y + speed;
    //  println("under");
    //}
  }
  void mutate() {
    //need to create a gene to mutate
  }
  @Override public int compareTo(Worm comparestu) {
    float compareFitness = ((Worm)comparestu).fitness;
    if (fitness > compareFitness) return 1;
    else if (fitness < compareFitness) return -1;
    return 0;
  }
  //sets up how to sort the fitness
}
