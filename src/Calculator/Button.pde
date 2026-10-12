class Button {
  // Member variables
  float x, y, w, h;
  color c1, c2;
  String val;
  boolean hover;

  // Constructor
  Button(float x, float y, float w, float h, String val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    c1 = color(#E8E0D0);
    c2 = color(#D6C4AF);
    this.val = val;
    hover = false;
  }

  // Member methods
  void display() {
    if (hover == true) {
      fill(c1);
    } else {
      fill(c2);
    }
    rect(x, y, w, h);
    fill(0);
    textAlign(CENTER);
    textSize(12);
    text(val, x+15, y+15);
  }
  void mouseOver(float tempX, float tempY) {
    if (tempX > x && tempX < x+w && tempY > y && tempY < y+h) {
      hover = true;
    } else {
      hover = false;
    }
  }
}
