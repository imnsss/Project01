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
  
  PImage bone;
  float x;
  float y;
  float speed;
  float gravity;
  float w;
  float life = 255;
  
  Bone(float tempX, float tempY, float tempW) {
    
    bone = loadImage("bone.png");
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
    gravity = 0.1;
  }
  
    void move() {
      
    speed = speed + gravity;
    y = y + speed;
    
    if (y > height) {
      
      speed = speed * -0.8;
      y = height;
    }
  }
  
  boolean finished() {
    
    life--;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }
  
  void display() {

    fill(0,life);
    image(bone,x,y,w,w);
  }
  
}
