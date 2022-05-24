import java.util.*;
LinkedList<canvas>layers;
import javax.swing.JColorChooser;
import java.awt.Color;
int sx;
//int toolType;
int time;
int sy; 
canvas a;
color C = 0;
int cx = (155);
int chosen=0;
pen p; 
Eraser e; 
tool t;
int sw;
void setup() {
  size(1000, 800);
  background(255);
  layers = new LinkedList<canvas>();
  layers.add(new canvas());
  layers.getFirst().enable(true);
  a = layers.get(chosen);
  sw = 2;
  p = new pen(C,sw);
  e = new Eraser(sw);
  t = p;

}
void mouseClicked() {
  if ((mouseX > 30 && mouseX < 60) && (mouseY > 30 && mouseY < 60)) {
    a.paintList.clear();
    background(255);
    a.count = 0;
    square(30, 30, 30);
    time = millis();
  }
  else if ((mouseX > 90 && mouseX < 120) && (mouseY > 90 && mouseY < 120)) {
    layers.add(new canvas());
  }
  else if ((mouseX > 375 && mouseX < 405) && (mouseY > 90 && mouseY < 120)) {
    t = e;
  }
  else if ((mouseX > 435 && mouseX < 465) && (mouseY > 90 && mouseY < 120)) {
    t = p;
  }
  else if ((mouseX > 30 && mouseX < 60) && (mouseY > 90 && mouseY < 120)) {
    Color c;
    c = JColorChooser.showDialog(null, "Choose a Color", Color.black);
    if (c != null) C = color(c.getRed(), c.getGreen(), c.getBlue());
    p.setC(C);
  }
  else for (int i = 1; i <= layers.size(); i++) {
    if ((mouseX > 30+60*i && mouseX < 60+60*i) && (mouseY > 30 && mouseY < 60)) {
      background(255);
      canvas current = layers.get(i-1);
      boolean e = current.isEnabled();
      current.enable(e = !e);
      a.count=0;
    }
  }
}

void draw() {
  fill(190, 190, 190, 255);
  rect(0, 0, width, 120);
  fill(255);
  rect(140, 90, 205, 30);
  line(155, 105, 330, 105);
  circle(cx, 105, 20);
  if ((mouseX > 140 && mouseX < 345) && mouseY > 90 && mouseY < 120 && mousePressed) {
    sw = constrain(mouseX - 155, 0, 155);
    e.setSW(sw);
    p.setSW(sw);
    cx = constrain(mouseX, 155, 330);
  } else if (mousePressed) {
    canvas a = layers.get(chosen);
    if (a.isEnabled())
      a.addPaint(t.makePaint());
  }
  for (canvas i : layers) {
    if (i.isEnabled()) {
      for (int j = a.count; j < i.paintList.size(); j++) {
        i.paintList.get(j).drawLine();
        a.count++;
      }
    }
  }
  sx = mouseX;
  sy = mouseY;
  for (int i = 1; i <= layers.size(); i++) {
    strokeWeight(1);
    pushStyle();
    if (layers.get(i-1).isEnabled())    
      stroke(color(0, 255, 0));
    square(30 + 60 *i, 30, 30);
    fill(0);
    text("layer " + i, 30 + 60 * i, 30, 30, 30);
    popStyle();
  }
  
  fill((t.equals(e)) ? #00ff00 : 255);
  square(375, 90, 30);
   fill((t.equals(p)) ? #00ff00 : 255);
  square(435, 90, 30);
  fill(255);
  pushStyle();
  if (millis() - time < 300)
    stroke(0, 255, 0);
  square(30, 30, 30);
  popStyle();
  fill(0);
  text("clear", 32, 45);
  text("pen", 437, 105);
  textSize(10);
  text("eraser", 375, 105);
  pushStyle();
  fill(0, 0, 255);
  textSize(42);
  text("+", 90, 118);
  popStyle();
  fill(C);
  square(30, 90, 30);
  // pop();
  //circle(95, 45, 20);
}
