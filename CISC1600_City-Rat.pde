// PROJECT 2: GRAPHING PROGRAMMING UNIT
// Huda Ayaz & Royta Iftakher (Group #21)
// CISC 1600

int state = 0, counter = 0;
float building_x = 0;
Rat rat = new Rat();
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
        counter = 0; //sets counter to 0 at the start of the game
        startScreen();
    } else if (state == 1) {
        drawCity();
        hole.draw();
        drawCounter();
        rat.draw();
        rat.run();
        hole.isCollided(rat);
        hole.getX();
    } else if (state == 2) { // Game over screen if rat dies
        gameOver();
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
    text("On a cold dark night in New York City, a city rat traverses the imposing landscape on the hunt for a morsel of food to quench its hunger. The journey is not easy: it runs into large sewer holes, death traps that threaten its very life, but with your help in avoiding these obstacles, it'll be able to survive the night.", 200, 150, 400, 400);
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
        }
    }
 }

// Game over screen
void gameOver() {
    textAlign(CENTER);
    background(#131862);

    // fill(#ffec9c);
    // rect(200, 100, 400, 150);
    textSize(55);
    strokeWeight(4);
    fill(#ff0000);
    text("GAME OVER", 400, 250);
    textSize(30);
    fill(#FFFFFF);
    text("Final Score: " + hole.getCount(), 400, 300);

    // Try Again button
    fill(#000000);
    rect(335, 390, 120, 50);
    textSize(20);
    fill(#FFFFFF);
    text("TRY AGAIN", 395, 420);

    // Change screen state if Try Again is clicked
    if (mousePressed == true) {
        if (mouseX >= 335 && mouseX <= 455 && mouseY >= 390 && mouseY <= 440) {
            hole.hole_x = 0;
            hole.newX = 900;
            hole.counter = 0;
            state = 1;
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
 
    stroke(#131862);
    strokeWeight(2);
    fill(#546bab); // the color for the rectangles: light navy
    
    //various buildings
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
    private float ratLeft, ratRight, ratTop, ratBottom;

    public Rat() {
        this.ychange = 0;
        this.isJumping = false;
        this.isFalling = false;
        this.ratLeft = 125; //115
        this.ratRight = 120; //237
        this.ratBottom = 100+ychange; // 410
    }

    public void draw() {
        stroke(#000000);
        strokeWeight(1);
        // rat tail
        fill(#6D7B8D);
        triangle(115, 373+ychange, 115, 380+ychange, 40, 377+ychange);
        // rat body
        ellipse(150, 380+ychange, 100, 55);
        // rat head
        fill(#6D7B8D);
        triangle(180, 350+ychange, 180, 400+ychange, 240, 375+ychange);
        // rat eye
        fill(#000000);
        circle(195, 370+ychange, 5);
        // rat nose
        fill(#ffc0cb);
        circle(234, 375+ychange, 9);
        // rat feet
        fill(#6D7B8D);
        ellipse(125, 405+ychange, 20, 10);
        ellipse(180, 405+ychange, 20, 10);

        this.ratBottom = 410+ychange;
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
        if (this.ychange == -100) {
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
  private int holeLeft, holeRight, holeTop, holeBottom;
  private int counter = 0;
  
  public Hole(){
    this.holeXPos = 900;
    this.holeYPos = 400;
    this.holeWidth = 160;
    this.holeHeight = 80;
    this.holeColor = #87889c;
    newX = this.holeXPos;

    this.holeLeft = this.newX - this.holeWidth/2 ;
    this.holeRight = this.newX + this.holeWidth/2;
    this.holeTop = this.holeYPos - this.holeHeight/2;
    this.holeBottom = this.holeYPos + this.holeHeight/2;
  }
  
  public Hole(int xPos, int yPos, int hWidth, int hHeight, int hColor){
    this.holeXPos = xPos;
    this.holeYPos = yPos;
    this.holeWidth = hWidth;
    this.holeHeight = hHeight;
    this.holeColor = hColor;

    this.holeLeft = this.newX - this.holeWidth/2;
    this.holeRight = this.newX + this.holeWidth/2;
    this.holeTop = this.holeYPos - this.holeHeight/2;
    this.holeBottom = this.holeYPos + this.holeHeight/2;
    newX = xPos;
  }
  //draws the hole object
  public void draw(){
    hole_x = hole_x + 3;

    this.holeLeft = this.newX - this.holeWidth/2;
    this.holeRight = this.newX + this.holeWidth/2;
    this.holeTop = this.holeYPos - this.holeHeight/2;
    this.holeBottom = this.holeYPos + this.holeHeight/2;

    if (hole_x > 1000){
      hole_x = 0;
      newX = 900;
      this.counter++;
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
    //stroke(#000000);
    //text(""+newX, 200, 350, 400, 400);
    return this.newX;
  }

  // if rat collides with hole, game over
  public void isCollided(Rat rat) {
    if (rat.ratRight >= this.holeLeft && rat.ratLeft <= this.holeRight && rat.ratBottom >= this.holeTop && rat.ratBottom <= this.holeBottom) {
        state = 2;
    }
  }

  public int getCount(){
    return this.counter;
  }
}

//this displays the score text on the top left corner of the screen
void drawCounter(){
    stroke(#FFFFFF);
    textSize(36);
    fill(#ffec9c);
    text("Score: "+ hole.getCount(), 70, 40);
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
