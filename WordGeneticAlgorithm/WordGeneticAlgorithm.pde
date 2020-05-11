 
// setup()
//  # Step 1: The Population 
//    # Create an empty population (an array or ArrayList)
//    # Fill it with DNA encoded objects (pick random values to start)

// draw()
//  # Step 1: Selection 
//    # Create an empty mating pool (an empty ArrayList)
//    # For every member of the population, evaluate its fitness based on some criteria / function, 
//      and add it to the mating pool in a manner consistant with its fitness, i.e. the more fit it 
//      is the more times it appears in the mating pool, in order to be more likely picked for reproduction.

//  # Step 2: Reproduction Create a new empty population
//    # Fill the new population by executing the following steps:
//       1. Pick two "parent" objects from the mating pool.
//       2. Crossover -- create a "child" object by mating these two parents.
//       3. Mutation -- mutate the child's DNA based on a given probability.
//       4. Add the child object to the new population.
//    # Replace the old population with the new population
//  
//   # Rinse and repeat

PFont f;
String target;
int popmax;
float mutationRate;
Element element;


void setup() {
  size(640, 360);
  f = createFont("Arial", 32, true);
  target = "Hello Github, this is my word algorithm";
  //target = "Scott loves the word solution and is taking AP chem next year because of this";
  popmax = 2000;
  mutationRate = 0.01;

  // Create a populationation with a target phrase, mutation rate, and populationation max

  element = new Element(target, mutationRate, popmax);
}

void draw() {

  // Generate mating pool
  element.naturalSelection();
  // next generatioln
  element.generate();
  // calc that young fitness
  element.calcFitness();
  displayInfo();

  if (element.finished()) {
    println(millis()/1000.0);
    noLoop();
  }
}

void displayInfo() {
  background(255);
  
  
  String answer = element.getBest();
  textFont(f);
  textAlign(LEFT);
  fill(0);
  
  textSize(20);
  text("Best phrase:",20,30);
  textSize(32);
  text(answer, 20, 100);

  textSize(18);
  text("total generations:     " + element.getGenerations(), 20, 160);
  text("average fitness:       " + nf(element.getAverageFitness(), 0, 2), 20, 180);
  text("total population: " + popmax, 20, 200);
  text("mutation rate:         " + int(mutationRate * 100) + "%", 20, 220);
 
  textSize(15);
  text("All phrases:\n" + element.allPhrases(), 450, 10);
}
