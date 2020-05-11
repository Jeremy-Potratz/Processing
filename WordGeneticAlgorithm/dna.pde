// A class to describe a psuedo-DNA, i.e. genotype
//   Here, a virtual organism's DNA is an array of character.
//   Functionality:
//      -- convert DNA into a string
//      -- calculate DNA's "fitness"
//      -- mate DNA with another set of DNA
//      -- mutate DNA

class DNA {
  char[] genes;
  float fitness;


  DNA(int num) {

    genes = new char[num];

    for (int i = 0; i < genes.length; i++) {
      genes[i] = (char) random(32, 128);
    }
  }

  String getPhrase() {
    return new String(genes);
  }

  void fitness(String target) {

    int score = 0;

    for ( int i = 0; i < genes.length; i++) {
      if ( genes[i] == target.charAt(i)) {
        score++;
      }
      fitness = (float)score / (float)target.length();
    }
  }

  DNA crossover(DNA partner) {

    DNA child = new DNA(genes.length);

    int midpoint = int(random(genes.length));
    for (int i = 0; i < genes.length; i++) {
      if (i> midpoint) child.genes[i] = genes[i];
      else             child.genes[i] = partner.genes[i];
    }
    return child;
  }

  void mutation(float mutationRate) {
    for ( int i =0; i < genes.length; i++) {
      if (random(1) < mutationRate) {
        genes[i] = (char) random(32, 128);
      }
    }
  }
}