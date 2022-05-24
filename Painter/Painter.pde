import java.util.*;
LinkedList<canvas>layers;
import javax.swing.JColorChooser;
import java.awt.Color;
int sx;
int toolType;
int time;
int sy; 

color C = 0;
int count; 
int chosen=0;
boolean e = true;
tool t;
int sw;
int c;
void setup(){
  size(1000,800);
  background(255);
  layers = new LinkedList<canvas>();
  layers.add(new canvas());
  sw = 2;
  c = 0;
  t = new pen(c, sw);
  //toolType = 1;
}
void mouseClicked() {
  if ((mouseX > 30 && mouseX < 60) && (mouseY > 30 && mouseY < 60)) {
    layers.get(chosen).paintList.clear();
    background(255);
    count = 0;
    stroke(color(#00ff00));
    square(30, 30, 30);
    time = millis();
  }
  if ((mouseX > 30 && mouseX < 60) && (mouseY > 90 && mouseY < 120)) {
    Color c;
    c = JColorChooser.showDialog(null, "Choose a Color", Color.black);
    if (c != null) C = color(c.getRed(), c.getGreen(), c.getBlue());
  }
  for (int i = 1; i <= layers.size(); i++) {
    if ((mouseX > 30+60*i && mouseX < 60+60*i) && (mouseY > 30 && mouseY < 60)) {
      background(255);
      e = !e;
      layers.getFirst().enable(e);
      count=0;
      stroke(color(#00ff00));
      square(30, 30, 30);
    }
  }
}

void keyPressed() {
  if (key == 'e') {
    t = new Eraser(sw);
  }
  if (key == 'p') {
    t = new pen(c, sw);
  }
}
void draw(){
  if(mousePressed){
    canvas a = layers.get(chosen);
    if(a.isEnabled())
   a.addPaint(t.makePaint());
  }
  for (canvas i : layers) {
    if (i.isEnabled()) {

      for (int j = count; j < i.paintList.size(); j++) {
        i.paintList.get(j).drawLine();
        count++;
      }
    }
  }
  sx = mouseX;
  sy = mouseY;
  for (int i = 1; i <= layers.size(); i++) {

    strokeWeight(1);
    if (e)
      stroke(color(#00ff00));
    else 
    stroke(color(0));
    square(30 + 60 *i, 30, 30);
    push();
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
  // stroke(0);
  fill(C);
  strokeWeight(1);
  square(30, 90, 30);
  pop();
}
