class Population {
  //creates the arrays
  ArrayList<Worm> population = new ArrayList<Worm>();
  float mutationRate;
  ArrayList<Worm> matingPool = new ArrayList<Worm>();
  int size, age;

  Population(int _size, float mr) {
    size = _size;
    mutationRate = mr;
    
    //creates a population
    for (int i = 0; i < size; i++) {
      population.add(new Worm());
    }
  }

  void live() {
    if (age < lifeSpan) {
      for (Worm worm : population) {
        worm.move(worm.dna.genes[age]);
        //moves the worms
        //println(d);
      }
    } else if (age == lifeSpan) {
      computeFitness();
      makeMatingPool();
      //creates a mating pool and waits 10 frames before breeding the next population
    } else if (age > lifeSpan+10) {
      breed();
      age =  0;
      //resets the age
    }
    for (Worm worm : population) {
      worm.display();
      //displays the worms
    }
    age++;
    //increases age
  }
  void computeFitness() {
    for (Worm worm : population) {
      float fit = PVector.dist(end, worm.getLocation());
      worm.fitness = fit*fit;
      println(worm.fitness);
      //calculates fitness
    }
    Collections.sort(population);
    //Sorts fitness from best to worst
      println("==============================");
    for (Worm worm : population) {
      println(worm.fitness);
    }
      println("==============================");
  }

  void makeMatingPool() {
    matingPool.clear();
    //for (Worm worm : population) {
    for (int i = 0; i < size/2; i++) {
      Worm worm = population.get(i);
      matingPool.add(worm);
      worm.c = 0;
      //adds worms to the mating pool and colors them differently 
    }
    //}
  }

  void breed() {
    population.clear();
    int matingPoolSize = matingPool.size();
    for (int i = 0; i < size; i++) {
      int mommyIndex = (int)random(matingPoolSize);
      int daddyIndex = (int)random(matingPoolSize);
      Worm mommy = matingPool.get(mommyIndex);
      Worm daddy = matingPool.get(daddyIndex);
      Worm child = new Worm();
      for (int j = 0; j < lifeSpan; j++) {
        if (random(1) < 0.5) {
          child.dna.genes[j] = mommy.dna.genes[j];
        } else {
          child.dna.genes[j] = daddy.dna.genes[j];
        }
      }
      if (random(1) < mutationRate) {
        child.mutate();
      }
      population.add(child);
      //adds a child
    }
  }
}
