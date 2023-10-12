// PROJECT 2: GRAPHING PROGRAMMING UNIT
// Huda Ayaz & Royta Iftakher (Group #21)
// CISC 1600

int state = 0;
float building_x = 0;

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
        //drawRat();
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

// new 