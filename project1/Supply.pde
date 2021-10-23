class Food {
  PVector position;
  PImage Food;
  boolean exist = true;
  
  Food(float mouseX, float mouseY) {
    position = new PVector(mouseX, mouseY);
    Food = loadImage("food.png");
    Food.resize(Food.width/4, Food.height/4);
  }
  
  void draw(){
    if (exist && mouseButton == LEFT){
      
      image(Food, mouseX, mouseY);
      imageMode(CENTER);
    }
  }
  
  void run(){
    draw();
  }


}

class Water {
  PVector position;
  PImage Water;
  boolean exist = true;
  
  Water(float mouseX, float mouseY) {
    position = new PVector(mouseX, mouseY);
    Water = loadImage("water.png");
    Water.resize(Water.width/7, Water.height/7);
  }
   
  void draw(){
    if (exist && mouseButton == RIGHT){
      image(Water, mouseX, mouseY);
      imageMode(CENTER);
    } 
  }
  
  void run(){
    draw();
  }


}

class Bone {
  
  float gravity = 0.35;
float gravityDelta = 0.005;
float friction = 0.87;
  
  PVector position;
  PImage bone;
  PVector speed;
  int timestamp;
  boolean alive = true;;
  ArrayList<Bone> bones;

  
  Bone(float x, float y) {
    position = new PVector(x, y);
    bone = loadImage("bone.png");
    bone.resize(bone.width/3, bone.height/3);
    timestamp = millis();
    speed = new PVector(random(-1, 1), random(-1, 2));
    bones = new ArrayList<Bone>();
  }
  
  void update() {
    position.add(speed);
    position.y += gravity;
    speed.mult(friction);
    position.y = constrain(position.y, 0, height);
    
        if(position.y >= 600 || position.y <= 100) {
        gravityDelta *= -1;
        }
    
  }
  
  
  void draw() {
    if (alive) {
      image(bone, position.x, position.y);
      imageMode(CENTER);
    }
  }
  
  void run() {
    update();
    draw();
  }
  
}
