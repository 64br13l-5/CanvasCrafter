public class Image extends canvas{
  public PGraphics pg;
  public PImage img;
  public int x,y,w,h,sx,sy;
  public tool t;
  public boolean render = false;
  public Image(int w,int h,tool n,PImage img){
   pg = createGraphics(width,height);
   x=0;
   y=0;
   this.w = w;
   this.h = h;
   t = n; 
   this.img = img;
   enable(true);
  }
  public void renderImage(){
    if(mousePressed && a == this){
      if(mouseX > x && mouseY > y && mouseX < x+w && mouseY < x+w){
            x += mouseX - sx;
            y += mouseY - sy;
            pg.clear();
            render = false;

      }
    }
    sx = mouseX;
    sy = mouseY;
    if(render == false){
    pg.beginDraw();
    pg.image(img,x,y);
    pg.square(x,y+h/2,10);
    pg.square(x+w-10,y+h/2,10);
    pg.square(x+w/2,y,10);
    pg.square(x+w/2,y+h-10,10);
    pg.endDraw();
    render = true; 
    }
   
    image(pg,0,120);
  }


}
