class Doge {

  PImage imgCurrent, img1, img2, img3, img4, img5, img6, img7;
  PVector position, target;
  
  boolean moving = false;
  int movingMarktime = 0;
  int movingTimeout = 4000;
  float movingSpread = 4;
  
  
  boolean expressionChanges = false;
  int changeMarktime = 0;
  int changeTimeout = 6000;
  int changeDuration = 500;
  
  boolean debug = true;  //replace TRUE to FALSE to close the function
  float triggerDistance1 = 70;
  float triggerDistance2 = 5;
  float movementSpeed = 0.04;
  
  int food;
  float range = 40;

  float count = 100;
  boolean Hungry = false;

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
    img6 = loadImage("6.png"); // moving expression
    img6.resize(img6.width/2, img6.height/2);
    img7 = loadImage("7.png"); // moving expression
    img7.resize(img7.width/2, img7.height/2);
    
    imgCurrent = img1;
  }

  void update() {
    
    int t = millis();
    
    PVector mousePos = new PVector(mouseX, mouseY);
    moving = position.dist(mousePos) > triggerDistance1;
    
    if (moving) {
      Hungry = false;
      imgCurrent = img6;
      //position = position.lerp(target, movementSpeed).add(new PVector(random(-movingSpread, movingSpread), random(-movingSpread, movingSpread)));
      //if (position.dist(target) < triggerDistance2) {  
        movingTarget();  // set a range of moving
     // }
    }

    else if (!moving && t > movingMarktime + movingTimeout) { //t > 0 + 4000    //EXPRESSION
        if (!moving && t > changeMarktime + changeTimeout) { // t > 6000
          expressionChanges = true;
          changeMarktime = t;
        } 
        else if (expressionChanges && t > changeMarktime + changeDuration) { //
          expressionChanges = false;
        }
        if (expressionChanges) {
          imgCurrent = img2;
        }
        else{
          imgCurrent = img4;
        }
    }  
    
    else if(!moving && t > 3000 ) {  
      imgCurrent = img1; // back to normal
      Hungry = false;
    }
    
    if(moving && mouseButton == LEFT) {
      
        if(count <= 90){
          Hungry = true;
          count += 1;
        }else{
          Hungry = false;
        }
        count--;
    }
    
    if (moving||Hungry){
    position = position.lerp(target, movementSpeed); 
    //target = new PVector(random(range, width-range), random(range, height-range)); 
   
  
  } 
  
    if(Hungry && position.dist(target) < 7){
     foods[food].exist = false;
       SupplyTarget();
    }
  }
       
  void movingTarget() {
    if(mousePressed == true && mouseButton == LEFT){
      target = new PVector(mouseX, mouseY);
    } 
  }
    
  void SupplyTarget() {
      food = int(random(foods.length));
         if (foods[food].exist) {
           target = foods[food].position;
          }           
          imgCurrent = img7;
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
