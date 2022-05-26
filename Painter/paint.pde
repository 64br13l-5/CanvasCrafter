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
    Stack<TwoPoint> s = new Stack<TwoPoint>();
    s.add(new TwoPoint(x,x,y,1));
    s.add(new TwoPoint(x,x,y-1,-1));
    while (!s.isEmpty()){
      TwoPoint p = s.pop();
      int lx = p.x;
      if(inside(lx,p.y,C)){
        while(inside(lx-1,p.y,C)){
          pixels[(lx-1)+p.y*width] = color(c);
          lx--;
        }
      }
      if(lx < p.x)
        s.add(new TwoPoint(lx,p.x-1,p.y-p.y1,-p.y1));
      while(p.x <= p.x1){
        while(inside(p.x,p.y,C)){
          pixels[p.x+p.y*width] = color(c);
          p.x++;
          s.add(new TwoPoint(lx,p.x-1,p.y+p.y1,p.y1));
          if(p.x-1 > p.x1)
            s.add(new TwoPoint(p.x1+1,p.x-1,p.y-p.y1,-p.y1));
        }
        p.x++;
        while(p.x<p.x1 && !inside(p.x,p.y,C))
          p.x++;
        lx=p.x;
      }

      
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
