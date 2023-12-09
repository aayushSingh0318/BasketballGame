class confettiParticle {
  PVector position;
  PVector velocity;
  int lifespan;

  confettiParticle(float x, float y, float vx, float vy) {
    position = new PVector(x, y);
    velocity = new PVector(vx, vy);
    lifespan = 255;
  }

  void update() {
    position.add(velocity);
    lifespan -= 2;
  }

  void display() {
    float r = random(200, 255);
    float g = random(20, 50);
    float b = 0;
    noStroke();
    fill(r, g, b, lifespan);
    fill(r, g, b, lifespan);
    ellipse(position.x, position.y, 10, 10);
  }

  boolean isDead() {
    return lifespan <= 0;
  }
}
