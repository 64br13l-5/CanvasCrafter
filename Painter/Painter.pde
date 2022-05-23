import java.util.LinkedList;
LinkedList<canvas>layers;
int sx;
int toolType;

int sy; 
void setup(){
  size(1000,800);
  background(255);
  layers = new LinkedList<canvas>();
  layers.add(new canvas());
  toolType = 1;
}
void draw(){
  fill(255);
  strokeWeight(1);
  square(30,30,30);
  if(mousePressed){
    if((mouseX < 30 || mouseX > 60) && (mouseY < 30 || mouseY > 60))
    layers.getFirst().addPaint(new paint(mouseX,mouseY,sx,sy,0,2));
  }
  sx = mouseX;
  sy = mouseY;
  for(canvas i : layers){
    if(i.isEnabled())
      for(paint j : i.paintList){
        j.drawLine();
      }
  }
}
