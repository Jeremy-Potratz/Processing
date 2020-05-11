flowField FlowField;
ArrayList<Vehicle> vehicles;


void setup() {
  size(1000, 1000);
  background(255);

  FlowField = new flowField(20);
  vehicles = new ArrayList<Vehicle>();

  for (int i = 0; i < 111; i++){
   
    vehicles.add(new Vehicle(new PVector(random(width), random(height)), random(10,20), random(0.1,5)));
    
    
  }


}

void draw() {
  background(255);
  FlowField.display();
  
  for (Vehicle v : vehicles) {
   
      v.follow(FlowField);
      v.run();
    
    
  }
  
  
  
}