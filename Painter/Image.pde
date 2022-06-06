public class Image extends canvas{
  public PGraphics pg;
  public PImage img;
  public int x,y,w,h,sx,sy;
  public boolean render = false;
  public Image(int w,int h,PImage img){
   pg = createGraphics(width,height);
   x=0;
   y=0;
   this.w = w;
   this.h = h;
   this.img = img;
   enable(true);
  }
  public void renderImage(tool t){
    if(t.getClass().getName() == "Painter$pointer"){
      
    if(mousePressed && a == this){
      if(mouseX > x-10 && mouseX < x+10 && mouseY > (y+110+h/2)&& mouseY < (y+130+h/2))
      {
         w -= mouseX - sx;
         x += mouseX - sx;
         pg.clear();
         render = false;
      }
      else if(mouseX > x+w-10 && mouseX < x+w+10 && mouseY > (y+110+h/2)&& mouseY < (y+130+h/2))
      {
         w += mouseX - sx;
         pg.clear();
         render = false;
      }
      else if(mouseX > x+w/2-10 && mouseX < x+w/2+10  && mouseY > (y+110)&& mouseY < (y+130))
      {
         h -= mouseY - sy;
         y += mouseY - sy;
         pg.clear();
         render = false;
      }
      else if(mouseX > x+w/2-10  && mouseX < x+w/2+10  && mouseY > (y+110+h)&& mouseY < (y+130+h))
      {
         h += mouseY - sy;
         pg.clear();
         render = false;
      }
      else if(mouseX > x && mouseY > y && mouseX < x+w && mouseY < x+w){
            x += mouseX - sx;
            y += mouseY - sy;
            pg.clear();
            render = false;
      }
    }
    sx = mouseX;
    sy = mouseY;
    } else render = false;
    if(render == false){
    pg.beginDraw();
    pg.image(img,x,y,w,h);
    if(t.getClass().getName() == "Painter$pointer"){
    pg.square(x,y+h/2,10);
    pg.square(x+w-10,y+h/2,10);
    pg.square(x+w/2,y,10);
    pg.square(x+w/2,y+h-10,10);
    pg.fill(0,0);
    pg.strokeWeight(2);
    pg.rect(x,y,w,h);
     pg.fill(255);
    pg.strokeWeight(1);
    }
    pg.endDraw();
    render = true; 
    }
   
    image(pg,0,120);
  }


}
