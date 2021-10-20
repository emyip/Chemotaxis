int size;
boolean Pressed;
class Move {
  float myX, myY;
  Move() {
    myX = 175;
    myY = 250;
  }
  Move(float x, float y) {
    myX = x;
    myY = y;
  }
  void walk() {
    if (Pressed == true) {
      myX = (int)(Math.random()*500);
      myY = (int)(Math.random()*500);
    }
    float easing = 0.1;
    float targetX = mouseX;
    float dx = targetX - myX;
    myX += dx * easing * (int)(Math.random()*8)-3;

    float targetY = mouseY;
    float dy = targetY - myY;
    myY += dy * easing * (int)(Math.random()*9)-3;
  }
  void show() {
    int purple, blue, pink;
    int randomColor = (int)(Math.random()*3);
    pink = color(255, 192, 203);
    blue = color(18, 105, 199);
    purple = color(156, 81, 182);
    if (randomColor == 0) {
      fill(pink);
    } else if (randomColor == 1) {
      fill(blue);
    } else {
      fill(purple);
    }
    noStroke();
    size = (int)(Math.random()*30);
    ellipse(myX, myY, size, size);
  }
}

void mousePressed() {
  Pressed = true;
}
void draw() {
  background(0);
  for (int i = 0; i < newArray.length; i++) {
    newArray[i].walk();
    newArray[i].show();
  }
}
Move[] newArray;
void setup() {
  size(500, 500);
  background(0);
  newArray= new Move[100];
  for (int i = 0; i < newArray.length; i++) {
    newArray[i] = new Move();
  }
}
