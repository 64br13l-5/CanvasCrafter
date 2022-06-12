import java.util.*;
ArrayList<canvas>layers;
import javax.swing.JColorChooser;
import java.awt.Color;
int sx;
Controller keyboardInput;
int time;
int sy; 
canvas a;
color C = 0;
int cx = (215);
pen p; 
Eraser e; 
tool d; 
pointer pntr;
tool t;
Bucket b;
int sw;
boolean await = false;
void setup() {
  size(1000, 800);
  background(255);
  noSmooth();
  layers = new ArrayList<canvas>();
  layers.add(new canvas());
  layers.get(0).enable(true);
  a = layers.get(0);
  sw = 2;
  p = new pen(C, sw);
  e = new Eraser(sw);
  keyboardInput = new Controller();
  b = new Bucket(C);
  d = new tool();
  pntr = new pointer();
  t = p;
  
}
void keyReleased() {
  keyboardInput.release(keyCode);
}
void keyPressed() {
  keyboardInput.press(keyCode);
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
  }  else if ((mouseX > 735 && mouseX < 765) && (mouseY > 90 && mouseY < 100)) {
    
    selectInput("Select a folder to process:", "inputSelected");
    await = true;
    while(await == true) delay(10);
    

  } else if ((mouseX > 735 && mouseX < 765) && (mouseY > 110 && mouseY < 120)) {
    selectFolder("Select a folder to process:", "folderSelected");
     await = true;
    while(await == true) delay(10);
    
  } else if ((mouseX > 150 && mouseX < 180) && (mouseY > 90 && mouseY < 120)) {
    if (layers.size() > 1)
      layers.remove(layers.size()-1);
  } else if ((mouseX > 435 && mouseX < 465) && (mouseY > 90 && mouseY < 120)) {
    t = e;
  } else if ((mouseX > 495 && mouseX < 525) && (mouseY > 90 && mouseY < 120)) {
    t = p;
  } else if ((mouseX > 555 && mouseX < 605) && (mouseY > 90 && mouseY < 120)) {
    t = b;
  }else if ((mouseX > 615 && mouseX < 645) && (mouseY > 90 && mouseY < 120)) {
    t = d;
  } else if ((mouseX > 675 && mouseX < 705) && (mouseY > 90 && mouseY < 120)) {
    t = pntr;
  }
  else if ((mouseX > 30 && mouseX < 60) && (mouseY > 90 && mouseY < 120)) {
    Color c;
    c = JColorChooser.showDialog(null, "Choose a Color", Color.black);
    if (c != null) C = color(c.getRed(), c.getGreen(), c.getBlue(),c.getAlpha());
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
void inputSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
    await = false;
  } else {
    if(accept(selection.getName())){
      PImage img = loadImage( selection.getAbsolutePath());
      layers.add(new Image(img.width,img.height,img));
    }
    await = false;
  }
}
void draw() {
  background(200);
  
  
  // SLIDER for stroke width
  if(mousePressed){
  if ((mouseX > 200 && mouseX < 405) && mouseY > 90 && mouseY < 120 ) {
    sw = (int)(constrain(mouseX-215, 1, 175)*0.571428571);
    e.setSW(sw);
    p.setSW(sw);
    cx = constrain(mouseX, 215, 390);
  } else if ( mouseY >120 ) {
    if(t.equals(d)){
     
      if(a.pg.pixels[mouseX +mouseY*width] != 0) {
        C = a.pg.pixels[mouseX +mouseY*width];
      p.setC(C);
      b.setColor(C);
      }
    }
    else if (a.isEnabled() && t != pntr) {   
      if(a.count2>0){
        a.paintList.subList(a.paintList.size()-a.count2,a.paintList.size()).clear();
        a.count2=0;
      }
      a.addPaint(t.makePaint());
    }
  }
  }
  //Draw Func
  //load
  for (canvas i : layers) {
    if (i.isEnabled()) {
     if(i.getClass().getName() == "Painter$Image"){
       i.renderImage(t);
     }
      for (int j = i.count; j < i.paintList.size()-i.count2; j++) {
        i.paintList.get(j).drawLine(i);
        i.count++;
      }
      image(i.pg, 0, 0);
      


    }
  }
  //load
  sx = mouseX;
  sy = mouseY;
  //start position for draw
  //gui 
  fill(190, 190, 190, 255);
  rect(0, 0, width, 120);
  fill(255);
  rect(200, 90, 205, 30);
  line(215, 105, 390, 105);
  circle(cx, 105, 20);
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
    if(layers.get(i-1).getClass().getName() == "Painter$Image")    text("Image", 30 + 60 * i, 30, 30, 30);
    else text("Layer " + i, 30 + 60 * i, 30, 30, 30);
    popStyle();
  }
  fill((t.equals(e)) ? #00ff00 : 255);
  square(435, 90, 30);
  fill((t.equals(p)) ? #00ff00 : 255);
  square(495, 90, 30);
  fill((t.equals(b)) ? #00ff00 : 255);
  square(555, 90, 30);
  fill((t.equals(d))? #00ff00 : 255);
  square(615, 90, 30);
   fill((t.equals(pntr))? #00ff00 : 255);
  square(675, 90, 30);
  fill(255);
  rect(735,90,30,10);
  rect(735,110,30,10);
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
  text("pointer", 675, 105);

  text("import", 735, 99);
  text("export", 735, 119);
  textSize(8);
    text("dropper", 615, 105);

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
  if (keyboardInput.isPressed(Controller.LCNTRL ) && keyboardInput.isPressed(Controller.Z)) {

    if(a.count2 < a.paintList.size()){
    a.count2++;

    }
    a.count = 0;
    a.pg.beginDraw();
    a.pg.clear();
    a.pg.endDraw();
  }

    //check if the button P1_RIGHT is being pressed:
    if (keyboardInput.isPressed(Controller.LCNTRL) && keyboardInput.isPressed(Controller.Y)) {
        if(a.count2 > 0 )
      a.count2--;
}
if((t ==p || t ==e )&& mouseY > 120){
    pushStyle();
    noCursor();
    strokeWeight(0);
    stroke(t==e ? 0 : color(255-red(C),255-green(C),255-blue(C)));

    fill(C,t==e ? 0 : 255);
    circle(mouseX,mouseY,sw);
 popStyle();
  }
  else cursor();
}
void folderSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
    await=false;
  } else {
    println("saved to " + selection.getAbsolutePath());
    PImage temp = get(0, 120, width, height-120);
    temp.save(selection.getAbsolutePath() + "\\image.jpg");
    await=false;
  }
}
  static final String[] exts = { ".gif", ".png", ".jpeg", ".jpg", ".tiff", ".tif"};

  boolean accept(String name) {
    name = name.toLowerCase();
    for (int i = exts.length; i-- != 0;) {
        if (name.endsWith(exts[i]))  {
            return true;
        }
      }
    return false;
  }
  class Controller {
  static final int LCNTRL = 0;
  static final int Z = 1;
  static final int Y = 2;
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
      inputs[LCNTRL] = true;
    if (code == 'Z')
      inputs[Z] = true;
    if (code == 'Y')
      inputs[Y] = true;
  }
  void release(int code) {
    if (code == 17)
      inputs[LCNTRL] = false;
    if (code == 'Z')
      inputs[Z] = false;
    if (code == 'Y')
      inputs[Y] = false;
  }
}
