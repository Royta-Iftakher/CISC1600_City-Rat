// PROJECT 2: GRAPHING PROGRAMMING UNIT
// Huda Ayaz & Royta Iftakher (Group #21)
// CISC 1600

int state = 0;
float building_x = 0;
Rat rat = new Rat();
boolean blinkM;
//float hole_x = 0;
Hole hole = new Hole();

//star effect inititialization
int numStars = 200;

void setup() {
    size(800, 500);
    background(#131862);
    
    //random seed
    long seed = 123;
    randomSeed(seed);
}

// Draw function
void draw() {
    if (state == 0) {
        startScreen();
    } else if (state == 1) {
        drawCity();
        rat.draw();
        rat.run();
        hole.draw();
        hole.getX();
    } else if (state == 2) { // Game over screen if rat dies
        //gameOver();
    } else if (state == 3) { // Win screen if rat reaches the cheese
        //winScreen();
    }
}

// Rat is stationary, city background will be moving. If space is pressed, rat will jump
void keyPressed() {
    if (key == ' ') {
        if (!rat.isFalling) { // in order to prevent multiple jumps, rat can only jump if it is not falling
            rat.isJumping = true;
        }
    }
}

// Start screen
 void startScreen() {
    textAlign(CENTER);

    // Title
    textSize(55);
    text("CITY RAT ADVENTURES", 400, 100);

    // Description
    textSize(20);
    text("On a cold dark night in New York City, a city rat traverses the imposing landscape on the hunt for a morsel of food to quench its hunger. The journey is not easy: it runs into large sewer holes, death traps that threaten its very life, but with your help in avoiding these obstacles, it'll be able to get to his food and survive the night.", 200, 150, 400, 400);
    text("To jump over a hole, hit SPACE. Enjoy :)", 200, 350, 400, 400);

    // Start button
    fill(#000000);
    rect(335, 390, 120, 50);
    textSize(20);
    fill(#FFFFFF);
    text("START", 395, 420);

    // Change screen state if Start is clicked
    if (mousePressed == true) {
        if (mouseX >= 335 && mouseX <= 455 && mouseY >= 390 && mouseY <= 440) {
            state = 1;
            draw();
        }
    }
 }

 void drawCity(){
    background(#131862);
    
    //helps control the rate of blinking stars
    if((frameCount % 15 == 0)){
      noStroke();
      stars();
    }
    
    //draw the moon
    noStroke();
    fill(#ffec9c);
    ellipse(725, 50, 60, 60); // Larger circle
    fill(#131862);
    noStroke();
    ellipse(740, 45, 40, 40); // inner circle
  
    //draw the moving buildings
    fill(#3f3f4c);
    rect(0,350, 800, 300);
    building_x = building_x + 3;
    if (building_x > 240){
      building_x = 0;
    }
 
    stroke(#131862); // A color for the lines: medium navy
    strokeWeight(2); // The thickness of the lines
    fill(#546bab); // the color for the rectangles: light navy
    
    rect(0-building_x,350,80,-250);
    drawWindows(3,10);
    
    fill(#546bab);
    rect(80-building_x,350,80,-175);
    drawWindows(2,90);
    
    fill(#546bab);
    rect(160-building_x,350,80,-100);
    drawWindows(1,170);
    
    fill(#546bab);
    rect(240-building_x,350,80,-250);
    drawWindows(3,250);
    
    fill(#546bab);
    rect(320-building_x,350,80,-175);
    drawWindows(2,330);
    
    fill(#546bab);
    rect(400-building_x,350,80,-100);
    drawWindows(1,410);
    
    fill(#546bab);
    rect(480-building_x,350,80,-250);
    drawWindows(3,490);
    
    fill(#546bab);
    rect(560-building_x,350,80,-175);
    drawWindows(2,570);
    
    fill(#546bab);
    rect(640-building_x,350,80,-100);
    drawWindows(1,650);
    
    fill(#546bab);
    rect(720-building_x,350,80,-250);
    drawWindows(3,730);
    
    fill(#546bab);
    rect(800-building_x,350,80,-175);
    drawWindows(2,810);
    
    fill(#546bab);
    rect(880-building_x,350,80,-100);
    drawWindows(1,890);
    
    fill(#546bab);
    rect(960-building_x,350,80,-250);
    drawWindows(3,970);
}


public class Rat {
    private float x, y, xchange, ychange;
    private boolean isJumping, isFalling;

    public Rat() {
        this.xchange = 0;
        this.ychange = 0;
        this.isJumping = false;
        this.isFalling = false;
    }

    public void draw() {
        stroke(#000000);
        strokeWeight(1);
        // rat tail
        fill(#6D7B8D);
        triangle(115+xchange, 373+ychange, 115+xchange, 380+ychange, 40+xchange, 377+ychange);
        // rat body
        ellipse(150+xchange, 380+ychange, 100, 55);
        // rat head
        fill(#6D7B8D);
        triangle(180+xchange, 350+ychange, 180+xchange, 400+ychange, 240+xchange, 375+ychange);
        // rat eye
        fill(#000000);
        circle(195+xchange, 370+ychange, 5);
        // rat nose
        fill(#ffc0cb);
        circle(234+xchange, 375+ychange, 9);
        // rat feet
        fill(#6D7B8D);
        ellipse(125+xchange, 405+ychange, 20, 10);
        ellipse(180+xchange, 405+ychange, 20, 10);
    }

    public void run() {
        this.jumping();
        this.falling();
        this.jumpPeak();
        this.jumpEnd();
    }

    public void jumping() {
        if(isJumping) {
            this.ychange -= 2;
        }
    }

    public void falling() {
        if(isFalling) {
            this.ychange += 1;
        }
    }

    public void jumpPeak() {
        if (this.ychange == -90) {
            this.isJumping = false;
            this.isFalling = true;
        }
    }

    public void jumpEnd() {
        if (this.ychange == 0) {
            this.isFalling = false;
        }
    }
}
//object to create the holes
public class Hole{
  private int hole_x = 0;
  private int holeXPos, holeYPos, holeWidth, holeHeight, newX;
  private int holeColor;
  
  public Hole(){
    this.holeXPos = 900;
    this.holeYPos = 400;
    this.holeWidth = 160;
    this.holeHeight = 80;
    this.holeColor = #87889c;
    newX = this.holeXPos;
  }
  
  public Hole(int xPos, int yPos, int hWidth, int hHeight, int hColor){
    this.holeXPos = xPos;
    this.holeYPos = yPos;
    this.holeWidth = hWidth;
    this.holeHeight = hHeight;
    this.holeColor = hColor;
    newX = xPos;
  }
  
  public void draw(){
    hole_x = hole_x + 3;
    if (hole_x > 1000){
      hole_x = 0;
      newX = 900;
    }
    
    stroke(#555668);
    fill(#555668);
    newX = this.holeXPos-hole_x;
    ellipse(this.holeXPos - hole_x, this.holeYPos, this.holeWidth, this.holeHeight);
    fill(#272730);
    stroke(#272730);
    ellipse(this.holeXPos - hole_x, this.holeYPos + 5, this.holeWidth-4, this.holeHeight - 9);
  }
  
  public int getX(){
    stroke(#000000);
    text(""+newX, 200, 350, 400, 400);
    return this.newX;
  }
}

//draws a bunch of stars in the night sky
  void stars(){
      for (int i = 100; i < numStars; i += random(1,10)) {
        fill(#ffec9c);
        ellipse(random(width), random(height), 4, 4);
      }
  }
  
 //helps draw all those windows 
  void drawWindows(int buildingHeight, int xStart){
    //windows for tall rectangle xStart = 10
    if(buildingHeight == 3){
      fill(#e7bb67);
      rect(xStart-building_x,115,10,20);//1st row
      rect((xStart+25)-building_x,115,10,20);
      rect((xStart+50)-building_x,115,10,20);
    
      rect(xStart-building_x,145,10,20);//2nd row
      rect((xStart+25)-building_x,145,10,20);
      rect((xStart+50)-building_x,145,10,20);
    
      rect(xStart-building_x,175,10,20);//3rd row
      rect((xStart+25)-building_x,175,10,20);
      rect((xStart+50)-building_x,175,10,20);
    
      rect(xStart-building_x,205,10,20);//4th row
      rect((xStart+25)-building_x,205,10,20);
      rect((xStart+50)-building_x,205,10,20);
    
      rect(xStart-building_x,235,10,20);//5th row
      rect((xStart+25)-building_x,235,10,20);
      rect((xStart+50)-building_x,235,10,20);
    
      rect(xStart-building_x,265,10,20);//6th row
      rect((xStart+25)-building_x,265,10,20);
      rect((xStart+50)-building_x,265,10,20);
    
      rect(xStart-building_x,295,10,20);//7th row
      rect((xStart+25)-building_x,295,10,20);
      rect((xStart+50)-building_x,295,10,20);
    
      rect(xStart-building_x,325,10,15);//8th row
      rect((xStart+25)-building_x,325,10,15);
      rect((xStart+50)-building_x,325,10,15);

    } else if (buildingHeight == 2){
      //windows for medium rectangle
      fill(#e7bb67);
     
      rect(xStart-building_x,185,10,10);//1sd row
      rect((xStart+25)-building_x,185,10,10);
      rect((xStart+50)-building_x,185,10,10);
    
      rect(xStart-building_x,205,10,20);//2nd row
      rect((xStart+25)-building_x,205,10,20);
      rect((xStart+50)-building_x,205,10,20);
    
      rect(xStart-building_x,235,10,20);//3rd row
      rect((xStart+25)-building_x,235,10,20);
      rect((xStart+50)-building_x,235,10,20);
    
      rect(xStart-building_x,265,10,20);//4th row
      rect((xStart+25)-building_x,265,10,20);
      rect((xStart+50)-building_x,265,10,20);
    
      rect(xStart-building_x,295,10,20);//5th row
      rect((xStart+25)-building_x,295,10,20);
      rect((xStart+50)-building_x,295,10,20);
    
      rect(xStart-building_x,325,10,15);//6th row
      rect((xStart+25)-building_x,325,10,15);
      rect((xStart+50)-building_x,325,10,15);

    } else if (buildingHeight == 1){
      //windows for small rectangle
      fill(#e7bb67);
    
      rect(xStart-building_x,265,10,20);//1st row
      rect((xStart+25)-building_x,265,10,20);
      rect((xStart+50)-building_x,265,10,20);
    
      rect(xStart-building_x,295,10,20);//2nd row
      rect((xStart+25)-building_x,295,10,20);
      rect((xStart+50)-building_x,295,10,20);
    
      rect(xStart-building_x,325,10,15);//3rd row
      rect((xStart+25)-building_x,325,10,15);
      rect((xStart+50)-building_x,325,10,15);
    }
  }