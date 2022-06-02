public class Image extends canvas{
  public PGraphics pg;
  public int x,y,bottomx,bottomy;
  public tool t;
  public Image(int x, int y, int w,int h,tool n){
   this.x=x;
   this.y=y;
   bottomx = x+w;
   bottomy = y+h;
   t = n; 
  }


}
