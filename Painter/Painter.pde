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
int chosen=0;
boolean e = true;
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
  t = new pen(C, sw);
}
void mouseClicked() {
  if ((mouseX > 30 && mouseX < 60) && (mouseY > 30 && mouseY < 60)) {
    a.paintList.clear();
    background(255);
    a.count = 0;
    stroke(color(#00ff00));
    square(30, 30, 30);
    time = millis();
  }
  if ((mouseX > 90 && mouseX < 120) && (mouseY > 90 && mouseY < 120)) {
    layers.add(new canvas());
  }
  if ((mouseX > 30 && mouseX < 60) && (mouseY > 90 && mouseY < 120)) {
    Color c;
    c = JColorChooser.showDialog(null, "Choose a Color", Color.black);
    if (c != null) C = color(c.getRed(), c.getGreen(), c.getBlue());
    t.setC(C);
  }
  for (int i = 1; i <= layers.size(); i++) {
    if ((mouseX > 30+60*i && mouseX < 60+60*i) && (mouseY > 30 && mouseY < 60)) {
      background(255);
      e = !e;
      layers.get(i-1).enable(e);
      a.count=0;
    }
  }
}

void keyPressed() {
  //if (key == 'z') {
  //  layers.get(chosen).paintList.removeLast();
  //}
  if (key == 'e') {
    t = new Eraser(sw);
  }
  if (key == 'p') {
    t = new pen(C, sw);
  }
}
void draw() {

  rect(140, 30, 200, 30);
  line(155, 45, 330, 45);
  if ((mouseX > 155 && mouseX < 330) && mouseY > 30 && mouseY < 60 && mousePressed) {
    sw = mouseX - 155;
    t.setSW(sw);
    circle(mouseX, 45, 20);
  }
  
  else if (mousePressed) {
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
    push();
    if (layers.get(i-1).isEnabled())    
      stroke(color(0, 255, 0));

    square(30 + 60 *i, 30, 30);

    fill(0);
    text("layer " + i, 30 + 60 * i, 30, 30, 30);
    pop();
  }
  if (millis() - time > 300)
    stroke(0);
  strokeWeight(1);
  square(30, 30, 30);
  push();
  fill(0);
  text("clear", 32, 45);
  push();
  fill(0, 0, 255);
  textSize(42);
  text("+", 90, 118);
  pop();
  stroke(0);
  fill(C);
  strokeWeight(1);
  square(30, 90, 30);
  pop();
  //circle(95, 45, 20);
}
