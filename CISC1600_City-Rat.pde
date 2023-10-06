// PROJECT 2: GRAPHING PROGRAMMING UNIT
// Huda Ayaz & Royta Iftakher (Group #21)
// CISC 1600

int state = 0;

void setup() {
    size(500, 500);
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
    //textFont(bigFont);
    //textAlign(center);
    //fill(white);
    text("City Rat Adventures", 200, 100);
 }

 void drawCity(){
    building_x = building_x + 1;
    if (building_x > 240){
      building_x = 0;
    }
    stroke(#131862); // A color for the lines: medium navy
    strokeWeight(2); // The thickness of the lines
    fill(#546bab); // the color for the rectangles: light navy
    rect(-240+building_x,350,80,-250);
    rect(-160+building_x,350,80,-175);
    rect(-80+building_x,350,80,-100);
    rect(0+building_x,350,80,-250);
    rect(80+building_x,350,80,-175);
    rect(160+building_x,350,80,-100);
    rect(240+building_x,350,80,-250);
    rect(320+building_x,350,80,-175);
    rect(400+building_x,350,80,-100);
    rect(480+building_x,350,80,-250);
    rect(560+building_x,350,80,-175);
    rect(640+building_x,350,80,-100);
    rect(720+building_x,350,80,-250);
}

