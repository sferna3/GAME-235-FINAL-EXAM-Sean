class Player extends Car{
  PVector location;
  PVector velocity;
  PShape playerCar;
  int CAR_WIDTH, CAR_HEIGHT;
  float mergeSpeed;
  float carSpeed;
  float maxSpeed;
  float minSpeed;
  int BOUNDARY;
  
  Player(){
    CAR_WIDTH = 100;
    CAR_HEIGHT = 150;
    BOUNDARY = 20 + CAR_WIDTH/2;
    location = new PVector (BOUNDARY, height - (30 + CAR_HEIGHT/2)); 
    velocity = new PVector (0, 0);
    mergeSpeed = 10;
    carSpeed = 5;
    maxSpeed = 25;
    minSpeed = 5;
  }
  
  void render(){
    playerCar = createShape(RECT, location.x, location.y, CAR_WIDTH, CAR_HEIGHT);
    playerCar.setFill(color(0, 255, 0));
    shape(playerCar);
  }
  
  void update(char pressedKey){
    render();
    mergeLanes(pressedKey);
    location.add(velocity);
    detectBoundaries();
  }
  
  void mergeLanes(char pressedKey){
    switch(pressedKey){
      case 'a':
        velocity.set(-mergeSpeed, 0);
        break;       
      case 'd':
        velocity.set(mergeSpeed, 0);
        break;
      case 'w':
        if (carSpeed < maxSpeed){
          carSpeed = carSpeed + 5; 
        }
        break;
      case 's':
        if (carSpeed > minSpeed){
          carSpeed = carSpeed - 5; 
        }
        break;
      default:
        velocity.set(0, 0);
        break;
    }
  }
  
  void detectBoundaries(){
    if (location.x < BOUNDARY|| location.x > width - BOUNDARY){
      location.sub(velocity); 
    }
  }
  
  boolean didCollide(NPCar enemy){
    if(abs(dist(location.x, location.y, enemy.getX(), enemy.getY())) < CAR_WIDTH/2){
      return true;
    }
    else{
      return false; 
    }
  }
  
  float getSpeed(){
    return carSpeed; 
  }
}
