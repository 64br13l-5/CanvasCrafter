public class paint{
  private int x,y,xstart,ystart,strw;
  private color c;
  public paint(int X,int Y,int xs,int ys,color col, int sw){
    x = X;
    y = Y;
    xstart = xs;
    ystart = ys;
    c = col;
    strw = sw; 
  }
  public void drawLine(){
    fill(c);
    strokeWeight(strw);
    line(x,y,xstart,ystart);
  }
}
