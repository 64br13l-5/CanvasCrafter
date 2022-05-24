public class tool{
  private int index;
  public int getIndex() {
    return index;
  }
  public paint makePaint() {
    return new paint(mouseX, mouseY, sx, sy, 0, 2);
  }
}
