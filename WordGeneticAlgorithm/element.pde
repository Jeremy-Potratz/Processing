class Element {

  DNA[] population; // array for current population
  String targetString; // the targe we are working towards
  int popsize; // population size
  ArrayList<DNA> matingPool; // this can be changed so need to make arraylist for mating pool
  int generation; // how many generations have passed
  boolean finished;
  int perfectScore;


  Element(String s, float m, int num) {

    target = s;
    mutationRate = m;
    population = new DNA[num];
    for (int i = 0; i < population.length; i++) {
      population[i] = new DNA(target.length());
    }
    calcFitness();
    matingPool = new ArrayList<DNA>();
    finished = false;
    generation = 0;
    perfectScore = 1;
  }

  void calcFitness() {
    for (int i = 0; i < population.length; i ++) {
      population[i].fitness(target);
    }
  }

  void naturalSelection() {

    matingPool.clear();

    float maxFitness = 0;
    for (int i = 0; i < population.length; i ++) {
      if (population[i].fitness > maxFitness) {

        maxFitness = population[i].fitness;
      }
    }
    //higher fitness, more entries

    for (int i = 0; i < population.length; i ++) {

      float fitness = map(population[i].fitness, 0, maxFitness, 0, 1);
      int n = int(fitness * 100);
      for (int j = 0; j < n; j++) {
        matingPool.add(population[i]);
      }
    }
  }

  void generate() {

    for (int i = 0; i < population.length; i ++) {

      int a = int(random(matingPool.size()));
      int b = int(random(matingPool.size()));
      DNA partnerA = matingPool.get(a);
      DNA partnerB = matingPool.get(b);
      DNA child = partnerA.crossover(partnerB);
      child.mutation(mutationRate);
      population[i] = child;
    }
    generation++;
  }

  String getBest() {

    float record = 0.0;
    int index = 0;

    for (int i = 0; i < population.length; i ++) {
      if (population[i].fitness > record) {
        index = i;
        record = population[i].fitness;
      }
    }
    if (record == perfectScore) finished = true;
    return population[index].getPhrase();
  }

  boolean finished() {
    return finished;
  }

  int getGenerations() {

    return generation;
  }

  float getAverageFitness() {
    float total = 0;
    for (int i = 0; i < population.length; i++) {
      total += population[i].fitness;
    }
    return total / (population.length);
  }

  String allPhrases() {
    String everything = "";

    int displayLimit = min(population.length, 50);


    for (int i = 0; i < displayLimit; i++) {
      everything += population[i].getPhrase() + "\n";
    }
    return everything;
  }
  
}