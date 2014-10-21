SlotMachine machine;
boolean rolling = false;
// button information
boolean button = false;
int x = 640/2;
int y = 440;
int w = 150;
int h = 50;

// declare variables
// --------------------------------------------
// put your code inside here
int totalScore = 500;
int r0 ;
int r1 ;
int r2 ;

// --------------------------------------------

void setup() {
  size(640,480);
  textFont(createFont("fonts/Square_One.ttf", 20));
  machine = new SlotMachine();
}

void draw() {
  background(245,229,124);
  fill(64,162,171);
  rect(320,248,396,154,25);
  fill(253,253,253);
  rect(220,247,97,114,2);
  rect(320,247,97,114,2);
  rect(420,247,97,114,2);
  // draw button
  fill(64,162,171);
  noStroke();
  rectMode(CENTER);
  rect(x,y,w,h,105);
  // show title
  fill(64,64,63);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("Slot Machine",x,49);
  textSize(20);
  text("Score"+" "+":"+" "+totalScore,x, 89);
  
  // event handler
  if (button) {
    if (!rolling){
      rolling = true;
      
      // start rolling
      // -------------------------------------------------
      // put your code inside here
      
      totalScore = totalScore -50;
      
      r0 = int(random(6));
      r1 = int(random(6));
      r2 = int(random(6));
      machine.setSlotFruit (0,r0);
      machine.setSlotFruit (1,r1);
      machine.setSlotFruit (2,r2);
     
      
      //let the probability of 777 is 10%
      if (r0 == 0 && r1 == 0 && r2 == 0){
      
          int result = 0;
          result = machine.probability( 0.1 );
          if (result == 0){
          rolling = true;       
                          }
          else {
            rolling =false;
                }
          }        
      // -------------------------------------------------
    }
    machine.roll();
    textSize(19);
    text("Stop",x,y);
  
  } else {
    if (rolling){
      rolling = false;
      // stop rolling
      // -------------------------------------------------
      // put your code inside here
      r0 = int(random(6));
      r1 = int(random(6));
      r2 = int(random(6));
      machine.setSlotFruit(0,r0);
      machine.setSlotFruit(1,r1);
      machine.setSlotFruit(2,r2);
            
      int a = machine.getSlotScore(r0);
      int b = machine.getSlotScore(r1);
      int c = machine.getSlotScore(r2);
      //totalScore= totalScore + a + b + c;(if the same fruit doesn't double.)
            
      int m = machine.getFruitCount(0);
      int n = machine.getFruitCount(1);
      int o = machine.getFruitCount(2);
      int p = machine.getFruitCount(3);
      int q = machine.getFruitCount(4);
      int r = machine.getFruitCount(5);
      
      totalScore = totalScore + 60*m*m + 10*n*n + 20*o*o + 30*p*p + 40*q*q + 50*r*r;
      //if the same fruit double      
      // -------------------------------------------------
    }
    machine.stop();
    fill(253,253,253);
    textSize(19);
    text("Roll",x,y);
  }

}

// When the mouse is pressed, the state of the button is toggled.   
void mousePressed() {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    button = !button;
  }  
}
