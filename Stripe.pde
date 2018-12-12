class Stripe{
  PVector location;
  PVector velocity;
  PShape stripe;
  int STRIPE_HEIGHT;
  int STRIPE_WIDTH;
  
  Stripe(float yStart){
    location = new PVector(width/2, yStart);
    velocity = new PVector(0, 0);
    STRIPE_WIDTH = 10;
    STRIPE_HEIGHT = 30;
  }
  
  void render(){
    stripe = createShape(RECT, location.x, location.y, STRIPE_WIDTH, STRIPE_HEIGHT);
    stripe.setFill(255);
    shape(stripe);
  }
  
  void update(float speed){
    velocity.set(0, speed);
    location.add(velocity);
    render();
  }
  
  float getY(){
    return location.y; 
  }
  
  int getHeight(){
    return STRIPE_HEIGHT; 
  }
}
