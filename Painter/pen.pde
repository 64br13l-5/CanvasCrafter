public class pen extends tool{
  private color c;
  private int sw;
  public pen(color col, int str) {
    c = col;
    sw = str;
  }
  public paint makePaint() {
    return new paint(mouseX, mouseY, sx, sy, c, sw);
  }
}
