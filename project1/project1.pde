int numDoge = 1;
int numFood = 1;
int numWater = 1;


ArrayList<Bone> bones;

PImage background, begin;
PFont font;

boolean Begin = false;
boolean Start = false;


Doge[] Doge = new Doge[numDoge];
Food[] foods = new Food[numFood];
Water[] waters = new Water[numWater];

void setup() {
    size(1100, 700, P2D);
  
    background = loadImage("bg.jpg"); // background in bedroom
    background.resize(1100, 700);
    begin = loadImage("begin.png"); // begin background
    begin.resize(1100, 700);
  
    for (int i=0; i<Doge.length; i++) {
      Doge[i] = new Doge(random(width), random(height));
    }
    for (int i=0; i<foods.length; i++) {
      foods[i] = new Food(random(width), random(height));
    }
    for (int i=0; i<waters.length; i++) {
      waters[i] = new Water(random(width), random(height));
    }
     bones = new ArrayList<Bone>();
     bones.add(new Bone(width/2, 0, 2));
  
}

void draw() {

  
      surface.setTitle("Doge!   " +  frameRate);

      if(Begin == false){
        Begin();
      }
      if(keyPressed && key == ' '){
        Start = true;
      }
      if (Start == true) {
         background(background);
     
        for (int i=0; i<Doge.length; i++) {
          Doge[i].run();
        }
        for (int i=0; i<foods.length; i++) {
          foods[i].run();
        }
        for (int i=0; i<waters.length; i++) {
          waters[i].run();
        }
        for (int i= bones.size()-1; i >= 0; i--) {
          Bone bone = bones.get(i);
          bone.move();
          bone.display();
            if (bone.finished()){
              bones.remove(i);
            }              
        }
        if(keyPressed && key == 'b') {
            bones.add(new Bone(random(width),random(height), 55));
        }
      }
}
      

void Begin(){
  
  background(begin);  
  textAlign(CENTER); 
  fill(0);
  textSize(60);
  text("Once you come home",width/2,height/2-110);
  text("and find there is a DOGE in your bedroom", width/2,height/2-40);
  textSize(40);
  text("Use the left mouse button to feed it with food, ",width/2,height/2+70);
  text("the right mouse button to give it drink", width/2, height/2 + 120);
  text("Press SPACE to open your door",width/2,height/2+235);
  textSize(30);
  text("There is also a surprise when you press the middle mouse button & 'B' key",width/2, height/2 + 170);

}
