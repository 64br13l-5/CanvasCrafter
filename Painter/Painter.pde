import java.util.LinkedList;
LinkedList<canvas>layers;
int sx;
int toolType;
int time;
int sy; 
int count; 
int chosen=0;
boolean e = true;
void setup(){
  
  size(1000,800);
  background(255);
  layers = new LinkedList<canvas>();
  layers.add(new canvas());
  toolType = 1;
}
void mouseClicked(){
  if((mouseX > 30 && mouseX < 60) && (mouseY > 30 && mouseY < 60)){
    layers.get(chosen).paintList.clear();
    background(255);
    
    stroke(color(#00ff00));
    square(30,30,30);
    time = millis();
  
    }
    for(int i = 1; i <= layers.size();i++){
       if((mouseX > 30+60*i && mouseX < 60+60*i) && (mouseY > 30 && mouseY < 60)){
       background(255);
       e = !e;
       layers.getFirst().enable(e);
       count=0;
       stroke(color(#00ff00));
       square(30,30,30);
 
  
    }
   }
  

}
void draw(){
  if(mousePressed){
    canvas a = layers.get(chosen);
    if(a.isEnabled())
   a.addPaint(new paint(mouseX,mouseY,sx,sy,0,2));
  }
  for(canvas i : layers){
    if(i.isEnabled()){
  
      for(int j = count; j < i.paintList.size(); j++){
        i.paintList.get(j).drawLine();
        count++;
      
      }}
  }
  sx = mouseX;
  sy = mouseY;
  for(int i = 1; i <= layers.size();i++){
    
      strokeWeight(1);
      if(e)
       stroke(color(#00ff00));
      else 
       stroke(color(0));
      square(30 + 60 *i,30,30);
      push();
    fill(0);
    text("layer " + i, 30 + 60 * i,30,30,30);
    pop();
  }
  if(millis() - time > 300)
  stroke(0);
  strokeWeight(1);
  square(30,30,30);
  push();
  fill(0);
  text("clear",32,45);
  pop();
 
  
}
