public class Image extends canvas{
  public PGraphics pg;
  public PImage img;
  public int x,y,bottomx,bottomy;
  public tool t;
  public Image(int w,int h,tool n,PImage img){
   pg = createGraphics(w,h);
   x=0;
   y=0;
   bottomx = x+w;
   bottomy = y+h;
   t = n; 
   this.img = img;
  }
  public void renderImage(){
    pg.beginDraw();
    pg.image(img,0,0);
    pg.square(x,y+((bottomy-y)/2),10);
    pg.square(bottomx,y+((bottomy-y)/2),10);
    pg.square(x+((bottomx-x)/2),y,10);
    pg.square(x+((bottomx-x)/2),bottomy,10);
    pg.endDraw();
    image(pg,0,120);
  }


}
