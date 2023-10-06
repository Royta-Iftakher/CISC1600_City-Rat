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
        drawRat();
    } else if (state == 2) { // Game over screen if rat dies
        gameOver();
    } else if (state == 3) { // Win screen if rat reaches the cheese
        winScreen();
    }
}

// Start screen
 void startScreen() {
    textFont(bigFont);
    textAlign(center);
    fill(white);
    text("City Rat Adventures", 200, 100);
 }
