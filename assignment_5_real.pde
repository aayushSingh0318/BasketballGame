boolean launched = false;
boolean win = false;
boolean loss = false;
Ball b1;
Hoop h1;
float ball_locate;

void setup() {
  size(500, 500, P3D);
  noStroke();
  b1 = new Ball(250, 500, 0, 0, -15, -5, 50);
  h1 = new Hoop(250, 100, -100, 5); // Pass a speed value (e.g., 5) to control the movement speed

  fill(0);
  textSize(50);
}

void draw() {
  background(220);

  if (launched) {
    println(ball_locate);
    b1.applyVelocity();
    b1.checkWinLose(ball_locate);
    if (win) {
      text("you win", 200, 300);
    }
    if (loss) {
      text("you lose", 200, 300);
    }
  }

  h1.move(); // Move the hoop
  h1.display();
  b1.display();
}

void mousePressed() {
  if (!launched) {
    launched = true;
    ball_locate = mouseX;
  }
}

void keyPressed() {
  if (key == ' ') {
    launched = false;
    win = false;
    loss = false;
    b1.posReset(250, 500, 0, 0, -15, -5);
  }
}
