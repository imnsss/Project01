class Food {
  PVector position;
  PImage Food;
  boolean exist = true;
  
  

  Food(float mouseX, float mouseY) {
    position = new PVector(mouseX, mouseY);
    Food = loadImage("food.png");
    Food.resize(Food.width/4, Food.height/4);
  }
  
  void update() {
  
  }
  
  void draw(){
    if (exist && mouseButton == LEFT){
      
      image(Food, mouseX, mouseY);
      imageMode(CENTER);
    }
    return ;
  
  }
  
  void run(){
    update();
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
  
  void update() {
  
  }
  
  void draw(){
    if (exist && mouseButton == RIGHT){
      image(Water, mouseX, mouseY);
      imageMode(CENTER);
    }
  
  }
  
  void run(){
    update();
    draw();
  }


}

class Bone {
  
  PVector position;
  PImage bone;
  boolean alive = true;
  
  Bone(float x, float y) {
    position = new PVector(x, y);
    bone = loadImage("bone.png");
    bone.resize(bone.width/3, bone.height/3);

  }
  
  void update() {
    // TODO
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
