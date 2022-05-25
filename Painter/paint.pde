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
    color C = get(x,y);
    if(red(C) == red(c) && blue(C) == blue(c) && green(c) == green(C)) return;
    circle(x,y,4);
    filltool(x,y+4);
    filltool(x,y-4);
    filltool(x+4,y);
    filltool(x-4,y);
    
  }
  public void drawLine() {
    if (bucket == true) {
      fill(c);
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
