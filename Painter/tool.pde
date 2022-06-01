public class tool{
  private int index;
  private int sw;
  private color c;

  public int getIndex() {
    return index;
  }
  public paint makePaint() {
    return new paint(mouseX, mouseY, sx, sy, 0, 2,false,false);
  }
  public void setSW(int sw) {
    this.sw = sw;
  }
  public void setC(color C) {
  }
}
