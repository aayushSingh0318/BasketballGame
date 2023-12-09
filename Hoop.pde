class Hoop {
  PVector pos;
  PVector velocity;
  float size;

  PImage hoop_texture;
  PShape hoop;

  Hoop(float x, float y, float z, float speed) {
    pos = new PVector(x, y, z);
    velocity = new PVector(speed, 0, 0); // Initial velocity
    size = 150;

    hoop_texture = loadImage("hoop_texture.png");
    hoop = createShape(BOX, size);
    textureWrap(REPEAT);
    hoop.setTexture(hoop_texture);
  }

  void move() {
    // Update the hoop's position based on velocity
    pos.add(velocity);

    // Check for collision with the edges of the screen
    if (pos.x - size / 2 < 0 || pos.x + size / 2 > width) {
      // Reverse the direction when hitting the edges
      velocity.x *= -1;
    }
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    shape(hoop);
    popMatrix();
  }
}
