class Doge {

  PImage imgCurrent, img1, img2, img3, img4, img5, img6, img7, img8, img9;
  PVector position, target;
  float movementSpeed = 0.04;
  
  boolean normal = false;
  int normalMarktime = 0;
  int normalTimeout = 4000;
  
  boolean expressionChanges = false;
  int changeMarktime = 0;
  int changeTimeout = 5000;
  int changeDuration = 500;
  
  boolean debug = false;  //Switch TRUE to FALSE to open/close the function
  float triggerDistance1 = 70;
  float triggerDistance2 = 5;

  int food;
  int water;
  float margin = 40;

  float count = 0;
  float count2 = 0;
  boolean Hungry = false;
  boolean Thirsty = false;

  Doge(float x, float y){
    position = new PVector(x, y);
    target = new PVector(random(width), random(height));  
    
    img1 = loadImage("1.png"); // normal form
    img1.resize(img1.width/2, img1.height/2);
    img2 = loadImage("2.png"); // happy expression
    img2.resize(img2.width/2, img2.height/2);
    img3 = loadImage("3.png"); // worried expression
    img3.resize(img3.width/2, img3.height/2);
    img4 = loadImage("4.png"); // happy expression2
    img4.resize(img4.width/2, img4.height/2);
    img6 = loadImage("6.png"); // normal expression
    img6.resize(img6.width/2, img6.height/2);
    img7 = loadImage("7.png"); // eating
    img7.resize(img7.width/2, img7.height/2);
    img8 = loadImage("8.png"); // drinking
    img8.resize(img8.width/2, img8.height/2);
    img9 = loadImage("9.png"); // star
    img9.resize(img9.width/2, img9.height/2);
   
    imgCurrent = img1;
  }

  void update() {
    
    int t = millis();
    println(t);
    PVector mousePos = new PVector(mouseX, mouseY);
    normal = position.dist(mousePos) > triggerDistance1;
    
    if (normal) {
      Hungry = false;
      Thirsty = false;
      imgCurrent = img6;
      movingFoodTarget();  
      movingDrinkTarget();
    }

    else if (!normal && t > normalMarktime + normalTimeout) {  //EXPRESSION
        if (!normal && t > changeMarktime + changeTimeout) { 
          expressionChanges = true;
          changeMarktime = t;
        } 
        else if (expressionChanges && t > changeMarktime + changeDuration) { 
          expressionChanges = false;
        }
        if (expressionChanges) {
          imgCurrent = img2;
        }
        else{
          imgCurrent = img4;
        }
    }  
    
    if(normal && mouseButton == LEFT) {
      
      count ++;
      
        if(count > 10){
          Hungry = true;
          if (count == 25){
          count = 0;
          }
        }else{
          Hungry = false;
        }
    }
    
    if (normal||Hungry){
    position = position.lerp(target, movementSpeed); 
    } 
  
    if(Hungry && position.dist(target) < 7){
     foods[food].exist = false;
       FoodTarget();
    }
    
    if(normal && mouseButton == RIGHT) {
      
        count2 ++;
      
        if(count2 > 5){
          Thirsty = true;
          if (count2 == 15){
          count2 = 0;
          }
        }else{
          Thirsty = false;
        }
    }
        
    if (normal||Thirsty){
      position = position.lerp(target, movementSpeed); 
    } 
  
    if(Thirsty && position.dist(target) < 5){
       waters[water].exist = false;
       DrinkTarget();
    }
    
    if(mouseButton == CENTER) {
      target = new PVector(random(margin, width-margin+55), random(margin, height-margin+50));
      imgCurrent = img1;
      image(img9, random(margin, width-margin+30), random(margin, height-margin+30));
    }
    
  }
       
       
  void movingFoodTarget() {
    if(mousePressed == true && mouseButton == LEFT){
      target = new PVector(mouseX, mouseY);
    } 
  }
    
  void FoodTarget() {
      food = int(random(foods.length));
         if (foods[food].exist) {
           target = foods[food].position;
          }           
          imgCurrent = img7;
          foods[food].exist = true;
  }  
  
   void movingDrinkTarget() {
    if(mousePressed == true && mouseButton == RIGHT){
      target = new PVector(mouseX, mouseY);
    } 
  }
  
  void DrinkTarget() {
      water = int(random(waters.length));
         if (waters[water].exist) {
           target = waters[water].position;
          }           
          imgCurrent = img8;
          waters[water].exist = true;
  }  
  
  void draw() {
      
    if (debug) {
      noFill();
      stroke(0, 255, 0);
      ellipse(position.x, position.y, triggerDistance1*2, triggerDistance1*2);
      ellipse(position.x, position.y, triggerDistance2*2, triggerDistance2*2);
      line(target.x, target.y, position.x, position.y);
      stroke(255, 0, 0);
      rect(target.x, target.y, 10, 10);
    }
    
       image(imgCurrent, position.x, position.y);    
       imageMode(CENTER);
  }
    
  void run() {
     update();
     draw();
  }
   
}
