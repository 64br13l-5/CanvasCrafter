public class Eraser extends tool{
  private int sw;
  public Eraser(int st) {
    sw = st;
    
  }
  public paint makePaint() {
    return new paint(mouseX, mouseY, sx, sy, #ffffff, sw,false,true);
  }
   public void setSW(int sw) {
    this.sw = sw;
  }
}
