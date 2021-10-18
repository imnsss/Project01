int numDoge = 1;
int numFood = 1;
int numWater = 2;
int numBones = 6;

PImage background, bone;

Doge[] Doge = new Doge[numDoge];
Food[] foods = new Food[numFood];
Water[] waters = new Water[numWater];
Bone[] bones = new Bone[numBones];

void setup() {
  size(1100, 700, P2D);
  
    background = loadImage("bg.jpg"); // normal form
    background.resize(1100, 700);
  
    for (int i=0; i<Doge.length; i++) {
      Doge[i] = new Doge(random(width), random(height));
    }
    for (int i=0; i<foods.length; i++) {
      foods[i] = new Food(random(width), random(height));
    }
    for (int i=0; i<waters.length; i++) {
      waters[i] = new Water(random(width), random(height));
    }
    for (int i=0; i<numBones; i++) {
      bones[i] = new Bone(random(100, 1000), random(50, 650));
    }
  
}

void draw() {
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
      for (int i=0; i<bones.length; i++) {
        bones[i].run();
  }

       surface.setTitle("Doge!   " +  frameRate);
}
