class Ball {
  PVector pos;
  PVector vel;
  PVector gravity; // Declare gravity here
  float r;
  boolean hasHitHoop = false;

  PImage ball_texture;
  PShape ball;

  Ball(float x, float y, float z, float vx, float vy, float vz, float r) {
    pos = new PVector(x, y, z);
    vel = new PVector(vx, vy, vz);
    this.r = r;

    // Initialize gravity
    gravity = new PVector(0, 0.2, 0);

    // add the basketball texture
    ball_texture = loadImage("ball_texture.png");
    ball = createShape(SPHERE, r);
    textureWrap(REPEAT);
    ball.setTexture(ball_texture);
  }

  void applyVelocity() {
    // Only apply gravity if the ball hasn't hit the hoop yet
    if (!hasHitHoop) {
      vel.add(gravity);
    }
    pos.add(vel);
  }

  void posReset(float x, float y, float z, float vx, float vy, float vz) {
    pos = new PVector(x, y, z);
    vel = new PVector(vx, vy, vz);
    hasHitHoop = false; // Reset the flag when resetting position
  }

  void display() {
    pushMatrix();
    // once the ball is launched, the ball location cannot be moved
    if (launched) {
      translate(ball_locate, pos.y, pos.z);
    } else {
      // otherwise, the ball allows mouseX
      translate(mouseX, pos.y, pos.z);
    }

    shape(ball);
    popMatrix();
  }

  void checkWinLose(float x) {
    // Check for collisions with the hoop using a bounding box approach
    float hoopLeft = h1.pos.x - h1.size / 2;
    float hoopRight = h1.pos.x + h1.size / 2;
    float hoopTop = h1.pos.y - h1.size / 2;
    float hoopBottom = h1.pos.y + h1.size / 2;

    // Check if the ball is within the hoop's bounding box and hasn't hit the hoop yet
    if (x >= hoopLeft && x <= hoopRight && pos.y <= hoopTop) {
      win = true;
      // stops the ball from moving any more
      vel = new PVector(0, 0, 0);
      hasHitHoop = true; // Set the flag to true when the ball hits the hoop
    } else if (pos.y > height) {
      loss = true;
    }
  }
}
