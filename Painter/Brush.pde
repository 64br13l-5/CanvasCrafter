public class Brush extends tool {
  private int sw;
  private color c;
  public Brush(int sw, color c) {
    this.sw = sw;
    this.c = c;
  }
  public void setSW(int sw) {
    this.sw = sw;
  }
  public void setColor(color c) {
    this.c = c;
  }
    public paint makePaint() {

    return new paint(mouseX, mouseY, sx, sy, c, sw,false,false, true, false);

  }
}
