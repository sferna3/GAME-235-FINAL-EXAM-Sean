import processing.sound.*;

Player player;
int stripeStart;
ArrayList <Stripe> stripes;
NPCar[] enemies = new NPCar[2];
SinOsc crash;
SinOsc engine;
Env env;

void setup(){
  rectMode(CENTER);
  noStroke();
  size(800, 600);
  background (128);
  
  player = new Player();
  enemies[0] = new NPCar(0);
  enemies[0].render();
  enemies[1] = new NPCar(1);
  enemies[1].render();
  
  stripeStart = -15;
  stripes = new ArrayList<Stripe>();
  for(int i = 0; i < 12; i++){    
    stripes.add(new Stripe(stripeStart));
    stripeStart = stripeStart + 60;
  }
 
  //no idea what any of these sound like
  crash = new SinOsc(this);
  engine = new SinOsc(this);
  engine.freq(100);
  engine.amp(.5);
  env = new Env(this);
}

void draw(){
  background(128);
  env.play(engine, .02, .003, .01, .05);
  for(int i = 0; i < 12; i++){  
    stripes.get(i).update(player.getSpeed());
  }
  handleStripes();
  if(keyPressed){
    player.update(key);
  }
  else{
    player.update('x');
  }
  for(int i = 0; i < 2; i++){
    enemies[i].update(player.getSpeed()); 
  }
  
  //plays a sound when cars collide. hope it works.
  if(player.didCollide(enemies[0]) || player.didCollide(enemies[1])){
    env.play(crash, .001, .004, .3, .4);
  }
}

void handleStripes(){
  for(int i = 0; i < 12; i++){
    Stripe tempStripe = stripes.get(i);
    if(tempStripe.getY() > height + tempStripe.getHeight()/2){
      stripes.remove(i);
      stripes.add(new Stripe(-tempStripe.getHeight()/2));
    }
  }
}
