public class Eraser extends tool{
  private int sw;
  public Eraser(int st) {
    sw = st;
    
  }
  public paint makePaint() {
    return new paint(mouseX, mouseY, sx, sy, 0, sw,false,true);
  }
   public void setSW(int sw) {
    this.sw = sw;
  }
}
