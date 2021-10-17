class Food {
  PVector position;
  PImage Food;
  float sizeVal;
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
  float sizeVal;
  boolean exist = true;
  
  

  Water(float x, float y) {
    position = new PVector(x, y);
    sizeVal = random(20, 25);
    Water = loadImage("water.png");
    Water.resize(Water.width/7, Water.height/7);
  }
  
  void update() {
  
  }
  
  void draw(){
    if (exist){
      image(Water, position.x, position.y);
      imageMode(CENTER);
    }
  
  }
  
  void run(){
    update();
    draw();
  }


}
