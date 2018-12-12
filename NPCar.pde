class NPCar extends Car{  
  PVector location;
  PVector velocity;
  PShape enemyCar;
  int CAR_WIDTH, CAR_HEIGHT;
  float speedMultiplier;
  int lane;
  
  NPCar(int num){
    CAR_WIDTH = 100;
    CAR_HEIGHT = 150;
    location = new PVector (0, height - (30 + CAR_HEIGHT/2)); 
    velocity = new PVector (0, 0);
    speedMultiplier = random(.1, 2.0);
    lane = num;
  }
  
  void render(){
    if (lane == 0){
      location.set(100 + CAR_WIDTH/2, CAR_HEIGHT); 
    }
    else{
      location.set(width - (100 + CAR_WIDTH/2), CAR_HEIGHT); 
    }
  }
  
  void update(float speed){
    enemyCar = createShape(RECT, location.x, location.y,CAR_WIDTH, CAR_HEIGHT);
    enemyCar.setFill(color(255, 0, 0));
    shape(enemyCar);
    velocity.set(0, speed);
    velocity.mult(speedMultiplier);
    location.add(velocity);
    reset();
  }
  
  void reset(){
    if(location.y > height + CAR_HEIGHT/2){
      location.set(location.x, -CAR_HEIGHT);
      speedMultiplier = random(0.1, 2.0);
    }
  }
  
  float getX(){
    return location.x;
  }
  
  float getY(){
    return location.y; 
  }
  
}
