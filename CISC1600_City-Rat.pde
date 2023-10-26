// PROJECT 2: GRAPHING PROGRAMMING UNIT
// Huda Ayaz & Royta Iftakher (Group #21)
// CISC 1600

int state = 0;
float building_x = 0;
Rat rat = new Rat();

void setup() {
    size(800, 500);
    background(#131862);
}

// Draw function
void draw() {
    if (state == 0) {
        startScreen();
    } else if (state == 1) {
        drawCity();
        rat.draw();
        // rat is stationary, city in background will be moving. if space is pressed, rat will jump
        if (keyPressed == true) {
            if (key == ' ') {
                rat.setYchange(-2);
                rat.setYchange(2);
            }
        }
    } else if (state == 2) { // Game over screen if rat dies
        //gameOver();
    } else if (state == 3) { // Win screen if rat reaches the cheese
        //winScreen();
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
    building_x = building_x + 1;
    if (building_x > 240){
      building_x = 0;
    }
    stroke(#131862); // A color for the lines: medium navy
    strokeWeight(2); // The thickness of the lines
    fill(#546bab); // the color for the rectangles: light navy
    rect(0-building_x,350,80,-250);
    rect(80-building_x,350,80,-175);
    rect(160-building_x,350,80,-100);
    rect(240-building_x,350,80,-250);
    rect(320-building_x,350,80,-175);
    rect(400-building_x,350,80,-100);
    rect(480-building_x,350,80,-250);
    rect(560-building_x,350,80,-175);
    rect(640-building_x,350,80,-100);
    rect(720-building_x,350,80,-250);
    rect(800-building_x,350,80,-175);
    rect(880-building_x,350,80,-100);
    rect(960-building_x,350,80,-250);
}


public class Rat {
    private float x, y, xchange, ychange;

    public Rat() {
        // this.x = 200;
        // this.y = 400;
        this.xchange = 2;
        this.ychange = 2;
    }

    public void draw() {
        stroke(#000000);
        strokeWeight(1);
        // rat tail
        fill(#6D7B8D);
        triangle(115, 373, 115, 380, 40, 377);
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

    public void setYchange(float ychange) {
        this.ychange = ychange;
    }
}