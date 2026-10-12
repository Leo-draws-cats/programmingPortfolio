// Leo Williams | 9-14-26 | Calculator
/*Color Palette
 #C79B5C
 #A37E4B
 #7A5F38
 #523F26
 #F5BE71
 */
String displayVal;
float l, r, result;
char op;
boolean newEntry;
boolean left;
Button[] numButtons = new Button[10];
Button[] opButtons =  new Button [12];

void setup() {
  size(150, 270);
  displayVal = "0.0";
  l = 0.0;
  r = 0.0;
  result= 0.0;
  op = ' ';
  left = true;
  newEntry = true;
  numButtons[0] = new Button(45, 195, 30, 30, "0");
  numButtons[1] = new Button(15, 105, 30, 30, "1");
  numButtons[2] = new Button(45, 105, 30, 30, "2");
  numButtons[3] = new Button(75, 105, 30, 30, "3");
  numButtons[4] = new Button(15, 135, 30, 30, "4");
  numButtons[5] = new Button(45, 135, 30, 30, "5");
  numButtons[6] = new Button(75, 135, 30, 30, "6");
  numButtons[7] = new Button(15, 165, 30, 30, "7");
  numButtons[8] = new Button(45, 165, 30, 30, "8");
  numButtons[9] = new Button(75, 165, 30, 30, "9");
  opButtons[0] = new Button(15, 195, 30, 30, ".");
  opButtons[1] = new Button(105, 135, 30, 60, "=");
  opButtons[2] = new Button(75, 195, 60, 30, "CE");
  opButtons[3] = new Button(15, 60, 30, 30, "+");
  opButtons[4] = new Button(45, 60, 30, 30, "-");
  opButtons[5] = new Button(75, 60, 30, 30, "x");
  opButtons[6] = new Button(105, 60, 30, 30, "÷");
  opButtons[7] = new Button(105, 105, 30, 30, "-x");
  opButtons[8] = new Button(15, 225, 30, 30, "^");
  opButtons[9] = new Button(45, 225, 30, 30, "?");
  opButtons[10] = new Button(75, 225, 30, 30, "√");
  opButtons[11] = new Button(105, 225, 30, 30, "^2");
}

void draw() {
  background(75);
  updateDisplay();
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}

void updateDisplay() {
  //Background shape
  fill(#C79B5C);
  rect(15, 15, 120, 30);
  //Overlay text
  fill(0);
  textAlign(RIGHT);
  text(displayVal, width-30, 35);
}

void mouseReleased () {
  // Refresh hover for the exact release position.
  for (int i = 0; i < numButtons.length; i++) {
    numButtons[i].mouseOver(mouseX, mouseY);
  }

  for (int i = 0; i < numButtons.length; i++) {
    numButtons[i].mouseOver(mouseX, mouseY);
  }

  // number buttons
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover == true) {
      handleEvent(numButtons[i].val.charAt(0), true);

/*      if (newEntry || displayVal.equals("0.0")) {
        displayVal = digit;
        newEntry = false;
      } else {
        displayVal += digit;
      }
*/
      if (left == true) {
        l = float(displayVal);
      } else {
        r = float(displayVal);
      }
    }
  }

  // Operator buttons
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover == true) {
      char clicked  = opButtons[i].val.charAt(0);

      if (clicked == '=') {
        preformCalc();
      } else if (clicked == '+' || clicked == '-' ||
        clicked == 'x' || clicked == '÷') {
        op = clicked;
        left = false;
        newEntry = true;
        displayVal = str(op);
      } else if (opButtons[i].val.equals("-x")) {
        if (left == true) {
          l = l * -1;
          displayVal = str(l);
        } else {
          r = r * -1;
          displayVal = str(r);
        }
      } else if (clicked == '√') {
        if (left == true) {
          l = sqrt(l);
          displayVal = str(l);
        } else {
          r = sq(r);
          displayVal = str(r);
        }
      } else if (clicked == '.') {
        if (!displayVal.contains(".")) {
          if (left == true) {
            displayVal += ".";
            l = float(displayVal);
          } else {
            displayVal += ".";
            r = float(displayVal);
          }
        } else if (opButtons[i].val.equals("CE")) {
          if (left == true) {
            l = l * 0;
            displayVal = "0.0";
            newEntry = false;
          } else {
            r = r * 0;
            displayVal = "0.0";
            newEntry = false;
          }
        }
      }
    }
  }
}
void printState() {
  println(
    "l: " + l +
    " | r: " + r +
    " | result: " + result +
    " | left: " + left +
    " | op: " + op +
    "  display: " + displayVal );
}


void preformCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '÷') {
    if (r == 0) {
      displayVal = "ERROR";
      newEntry = true;
      return;
    }
    result = l / r;
  } else if (op == 'x') {
    result = l * r;
  } else {
    return;
  }
  displayVal = str(result);
  l = result;
  r = 0.0;
}

void keyPressed() {
  if (key == '1') {
    println("You hit 1 " + keyCode);
    handleEvent('1', true);
  }
}

void handleEvent(char val, boolean isNum) {
  if (isNum == true) {
    //stuff
     String digit = str(val);

      if (newEntry || displayVal.equals("0.0")) {
        displayVal = digit;
        newEntry = false;
      } else {
        displayVal += digit;
      }
  } else {
    //otherstuff
  }
}
