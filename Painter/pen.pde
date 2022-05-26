public class pen extends tool{
  private int sw;
  private color c;
  public pen(color col, int str) {
    c = col;
    sw = str;
  }
  public paint makePaint() {
    return new paint(mouseX, mouseY, sx, sy, c, sw,false);
  }
  public void setSW(int sw) {
    this.sw = sw;
  }
  public void setC(color C) {
    this.c = C;
  }
}
