import java.util.*;
ArrayList<canvas>layers;
import javax.swing.JColorChooser;
import java.awt.Color;
import java.util.*;
public PGraphics pg;
Controller keyboardInput;
int sx;
//int toolType;
int time;
int sy; 
canvas a;
color C = 0;
int cx = (215);
pen p; 
Eraser e; 
tool t;
Bucket b;
int sw;
void setup() {
  size(1000, 800);
  keyboardInput = new Controller();
  background(255);
  noSmooth();
  layers = new ArrayList<canvas>();
  layers.add(new canvas());
  layers.get(0).enable(true);
  a = layers.get(0);
  sw = 2;
  p = new pen(C, sw);
  e = new Eraser(sw);
  b = new Bucket(C);
  t = p;
}
void mouseClicked() {
  if ((mouseX > 30 && mouseX < 60) && (mouseY > 30 && mouseY < 60)) {
    a.paintList.clear();    
    a.count = 0;
    a.pg.beginDraw(); 
    a.pg.clear();
    a.pg.endDraw();
    square(30, 30, 30);
    time = millis();
  } else if ((mouseX > 90 && mouseX < 120) && (mouseY > 90 && mouseY < 120)) {
    layers.add(new canvas());
  } else if ((mouseX > 150 && mouseX < 180) && (mouseY > 90 && mouseY < 120)) {
    if (layers.size() > 1)
      layers.remove(layers.size()-1);
  } else if ((mouseX > 435 && mouseX < 465) && (mouseY > 90 && mouseY < 120)) {
    t = e;
  } else if ((mouseX > 495 && mouseX < 525) && (mouseY > 90 && mouseY < 120)) {
    t = p;
  } else if ((mouseX > 555 && mouseX < 605) && (mouseY > 90 && mouseY < 120)) {
    t = b;
  } else if ((mouseX > 30 && mouseX < 60) && (mouseY > 90 && mouseY < 120)) {
    Color c;
    c = JColorChooser.showDialog(null, "Choose a Color", Color.black);
    if (c != null) C = color(c.getRed(), c.getGreen(), c.getBlue(), c.getAlpha());
    p.setC(C);
    b.setColor(C);
  } else for (int i = 1; i <= layers.size(); i++) {
    if (mouseX > 30+60*i && mouseX < 60+60*i) {
      if (mouseY > 30 && mouseY < 60) {
        canvas current = layers.get(i-1);
        boolean e = current.isEnabled();
        current.enable(e = !e);
      } else if (mouseY > 5 && mouseY < 30) {
        a = layers.get(i-1);
      }
    }
  }
}

void keyReleased() {
  keyboardInput.release(keyCode);
}
void keyPressed() {
  keyboardInput.press(keyCode);
  if (key == 'p') {
    
  }
}

void draw() {
  
  //drawing stuff
  background(255);
  pushStyle();
  strokeWeight(1);
  stroke(0);
  fill(C, t==e ? 0 : 255);
  circle(mouseX, mouseY, sw);
  popStyle();
  fill(190, 190, 190, 255);
  rect(0, 0, width, 120);
  fill(255);
  rect(200, 90, 205, 30);
  line(215, 105, 390, 105);
  circle(cx, 105, 20);
  
  //slider + drawing
  if ((mouseX > 200 && mouseX < 405) && mouseY > 90 && mouseY < 120 && mousePressed) {
    sw = (int)(constrain(mouseX-215, 0, 175)*0.571428571);
    e.setSW(sw);
    p.setSW(sw);
    cx = constrain(mouseX, 215, 390);
  } else if (mousePressed && mouseY >120 ) {
    if (a.isEnabled()) {   
      a.addPaint(t.makePaint());
      if (a.count2 > 0) {
        while (a.count2 > 0) {
          a.count2--;
          a.paintList.remove(a.paintList.size() - 1);
        }
      }
    }
  }
  
  //drawing each paint
  
  for (canvas i : layers) {
    if (i.isEnabled()) {
      for (int j = i.count; j < i.paintList.size() - i.count2; j++) {
        i.paintList.get(j).drawLine(i);
        i.count++;
      }
      image(i.pg, 0, 0);
    }
  }
  sx = mouseX;
  sy = mouseY;
  
  //draw the layer buttons
  for (int i = 1; i <= layers.size(); i++) {
    strokeWeight(1);
    pushStyle();
    if (layers.get(i-1).isEnabled())    
      stroke(color(0, 255, 0));
    fill((a == layers.get(i-1)) ? #00ccee : 255);
    triangle(35+60*i, 10, 55+60*i, 10, 45+60*i, 25);
    fill(255);
    square(30 + 60 *i, 30, 30);
    fill(0);
    text("layer " + i, 30 + 60 * i, 30, 30, 30);
    popStyle();
  }
  fill((t.equals(e)) ? #00ff00 : 255);
  square(435, 90, 30);
  fill((t.equals(p)) ? #00ff00 : 255);
  square(495, 90, 30);
  fill((t.equals(b)) ? #00ff00 : 255);
  square(555, 90, 30);
  fill(255);
  circle(105, 105, 30);
  circle(165, 105, 30);
  pushStyle();
  if (millis() - time < 300)
    stroke(0, 255, 0);
  square(30, 30, 30);
  popStyle();
  fill(0);
  text("clear", 32, 45);
  text("pen", 497, 105);
  textSize(10);
  text("eraser", 435, 105);
  textSize(9);
  text("bucket", 555, 105);
  pushStyle();
  fill(0, 0, 255);
  textSize(42);
  text("+", 89, 118);
  fill(255, 0, 0);
  textSize(50);
  text("-", 151, 120);
  popStyle();
  fill(C);
  square(30, 90, 30);
  // pop();
  //circle(95, 45, 20);

  //CTRL Z AND Y STUFF 
  if (keyboardInput.isPressed(Controller.P1_LEFT ) && keyboardInput.isPressed(Controller.P1_RIGHT)) {

    if(a.count2 < a.paintList.size()){
    a.count2++;
    }
    a.pg.clear();
    a.count = 0;
  }

    //check if the button P1_RIGHT is being pressed:
    if (keyboardInput.isPressed(Controller.P1_LEFT) && keyboardInput.isPressed(Controller.P1Y)) {
        if(a.count2 > 0 )
    a.count2--;
}
}

class Controller {
  static final int P1_LEFT = 0;
  static final int P1_RIGHT = 1;
  static final int P1Y = 2;
  boolean [] inputs;

  public Controller() {
    inputs = new boolean[3];//2 valid buttons
  }

  /**@param code: a valid constant e.g. P1_LEFT
   */
  boolean isPressed(int code) {
    return inputs[code];
  }

  void press(int code) {
    if (code == 17)
      inputs[P1_LEFT] = true;
    if (code == 'Z')
      inputs[P1_RIGHT] = true;
    if (code == 'Y')
      inputs[P1Y] = true;
  }
  void release(int code) {
    if (code == 17)
      inputs[P1_LEFT] = false;
    if (code == 'Z')
      inputs[P1_RIGHT] = false;
    if (code == 'Y')
      inputs[P1Y] = false;
  }
}
