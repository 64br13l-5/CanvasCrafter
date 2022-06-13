public class paint {
  private int x, y, xstart, ystart, strw;
  private color c;
  private boolean bucket;
  private boolean eraser;
  private boolean brush;
  
  public paint(int X, int Y, int xs, int ys, color col, int sw, boolean bucket,boolean eraser, boolean brush, boolean spray) {
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
  public void sprayTool(int x, int y, canvas cv) {
  }
  public void drawLine(canvas cv) {
    if (bucket) {
      filltool2(x,y,cv);
    }
    else {
      cv.pg.beginDraw();
      cv.pg.pushStyle();
      if(eraser)     cv.pg.stroke(c,0);
      //else if(Spray) 
      else cv.pg.stroke(c);
      cv.pg.strokeWeight(strw);
      if(brush)  cv.pg.blendMode(SCREEN);
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
