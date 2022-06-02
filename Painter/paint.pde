public class paint {
  private int x, y, xstart, ystart, strw;
  private color c;
  private boolean bucket;
  private boolean eraser;
  private boolean brush;
  
  public paint(int X, int Y, int xs, int ys, color col, int sw, boolean bucket,boolean eraser, boolean brush) {
    x = X;
    y = Y;
    xstart = xs;
    ystart = ys;
    c = col;
    strw = sw; 
    this.bucket = bucket;
    this.eraser = eraser;
    this.brush = brush;
  }
  //public void filltool(int X,int Y){
  //  float t = millis();
  //  if(X > width || X<0 || Y>height || Y<0) return;
  //  loadPixels();
  //  color C = pixels[X+Y*width];
  //  if(color(c) == C) return;
  //  Stack<TwoPoint> s = new Stack<TwoPoint>();
  //  s.add(new TwoPoint(X,X,Y,1));
  //  s.add(new TwoPoint(X,X,Y-1,-1));
  //  while (!s.isEmpty()){
  //    TwoPoint p = s.pop();
  //    int x = p.x1;
  //    if(inside(x,p.y,C)){
  //      while(inside(x-1,p.y,C)){
  //        pixels[(x-1)+p.y*width] = color(c);
  //        x--;
  //      }
  //    }
  //    if(x < p.x1)
  //      s.add(new TwoPoint(x,p.x1-1,p.y-p.dy,-p.dy));
  //    while(p.x1 <= p.x2){
  //      while(inside(p.x1,p.y,C)){
  //        pixels[p.x1+p.y*width] = color(c);
  //        p.x1++;
  //        s.add(new TwoPoint(x,p.x1-1,p.y+p.dy,p.dy));
  //        if(p.x1-1 > p.x2)
  //          s.add(new TwoPoint(p.x2+1,p.x1-1,p.y-p.dy,-p.dy));
  //      }
  //      p.x1++;
  //      while(p.x1<p.x2 && !inside(p.x1,p.y,C)){
  //        p.x1++;
  //      }
  //      x=p.x1;
  //    }

      
  //  }
  //  print(millis() -t);
  //  updatePixels();
  //}
  public void filltool2(int x,int y,canvas cv){
    float t = millis();
    
    if(x > width || x<0 || y>height || y<120) return;
    cv.pg.loadPixels();
    color C = cv.pg.pixels[x+y*width];
    if(color(c) == C) return;
    Stack<Point> s = new Stack<Point>();
    s.add(new Point(x,y));
    while (!s.isEmpty()){
      Point p = s.pop();
      int lx = p.x;
      while(inside(lx-1,p.y,C,cv.pg.pixels)){
        cv.pg.pixels[(lx-1)+p.y*width] = color(c);
        lx--;
      }
      while(inside(p.x,p.y,C,cv.pg.pixels)){
        cv.pg.pixels[p.x+p.y*width] = color(c);
        p.x++;
      }
      scan(lx,p.x-1,p.y+1,C,s,cv.pg.pixels);
      scan(lx,p.x-1,p.y-1,C,s,cv.pg.pixels);
      
    }
    print(millis()-t);
    cv.pg.updatePixels();
  }
  boolean inside(int x, int y, color c,int[] px){
    if(x >= width || x<0 || y>=height || y<120) return false;
    return px[x+y*width] == c;
  }
  void scan(int lx,int rx, int y,color C, Stack<Point> s,int[] px){
    boolean added = false;
    for(int x  = lx+1; x < rx; x++){
      if(!inside(x,y,C,px))
        added = false;
      else if (!added){
         s.add(new Point(x,y));
         added = true;
      }
    }
  }
  public void drawLine(canvas cv) {
    if (bucket) {
      filltool2(x,y,cv);
    }
    else {
      cv.pg.beginDraw();
      cv.pg.pushStyle();
      if(eraser)     cv.pg.stroke(c,0);
      else cv.pg.stroke(c);
      cv.pg.strokeWeight(strw);
      if(brush)  cv.pg.blendMode(BLEND);
      else cv.pg.blendMode(REPLACE);
      cv.pg.line(x, constrain(y, 120, height), xstart, constrain(ystart, 120, height));
      cv.pg.popStyle();
      cv.pg.endDraw();
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
  public int x1;
  public int x2;
  public int y;
  public int dy;
  public TwoPoint(int x,int x1,int y, int y1){
    this.x1 = x; 
    this.y = y; 
    this.x2 = x1; 
    this.dy = y1; 
  }
}
