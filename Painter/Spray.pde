public class Spray extends tool {
  private color c;
  private int sw;
  public Spray(color c, int sw) {
    this.c = c;
    this.sw = sw;
  }
  public void setSW(int sw) {
    this.sw = sw;
  }
  public void setColor(int c) {
    this.c = c;
  }
  public paint makePaint() {
    return new paint(mouseX, mouseY, sx, sy, 0, sw,false, false, false, true);
  }
}
