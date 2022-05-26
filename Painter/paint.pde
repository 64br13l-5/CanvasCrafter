public class paint {
  private int x, y, xstart, ystart, strw;
  private color c;
  private boolean bucket;
  
  public paint(int X, int Y, int xs, int ys, color col, int sw, boolean bucket) {
    x = X;
    y = Y;
    xstart = xs;
    ystart = ys;
    c = col;
    strw = sw; 
    this.bucket = bucket;
  }
  public void filltool(int x,int y){
    if(x > width || x<0 || y>height || y<0) return;
    loadPixels();
    color C = pixels[x+y*width];
    if(color(c) == C) return;
    Stack<Point> s = new Stack<Point>();
    s.add(new Point(x,y));
    while (!s.isEmpty()){
      Point p = s.pop();
      int lx = p.x;
      while(inside(lx-1,p.y,C)){
        pixels[(lx-1)+p.y*width] = color(c);
        lx--;
      }
      while(inside(p.x,p.y,C)){
        pixels[p.x+p.y*width] = color(c);
        p.x++;
      }
      scan(lx,p.x-1,p.y+1,C,s);
      scan(lx,p.x-1,p.y-1,C,s);
      
    }
    updatePixels();
  }
  boolean inside(int x, int y, color c){
    if(x >= width || x<0 || y>=height || y<0) return false;
    return pixels[x+y*width] == c;
  }
  void scan(int lx,int rx, int y,color C, Stack<Point> s){
    boolean added = false;
    for(int x  = lx+1; x < rx; x++){
      if(!inside(x,y,C))
        added = false;
      else if (!added){
         s.add(new Point(x,y));
         added = true;
      }
    }
  }
  public void drawLine() {
    if (bucket == true) {
      filltool(x,y);
    } else {
      pushStyle();
      stroke(c);
      strokeWeight(strw);
      line(x, constrain(y, 120, height), xstart, constrain(ystart, 120, height));
      popStyle();
    }
  }
}
class Point{
  public int x;
  public int y;
  public Point(int x, int y){
    this.x = x; 
    this.y = y; 
  }
}
class TwoPoint{
  public int x;
  public int x1;
  public int y1;
  public int y;
  public TwoPoint(int x,int x1,int y, int y1){
    this.x = x; 
    this.y = y; 
    this.x1 = x1; 
    this.y1 = y1; 
  }
}
