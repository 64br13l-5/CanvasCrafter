import java.util.LinkedList;
LinkedList<canvas>layers;
int sx;
int sy; 
void setup(){
  size(1000,800);
  background(255);
  layers = new LinkedList<canvas>();
  layers.add(new canvas());
}
void draw(){
  if(mousePressed){
    layers.getFirst().addPaint(new paint(mouseX,mouseY,sx,sy,0,2));
  }
  sx = mouseX;
  sy = mouseY;
  for(canvas i : layers){
    for(paint j : i.paintList){
      j.drawLine();
    }
  }
}
