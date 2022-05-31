public class Bucket extends tool {
  private color c;
  public Bucket(color C) {
    c = C;
  }
  public void setColor(color C) {
    c = C;
  }
  //this is a placeholder we want the bucket tool to make more than one paint so im not totally sure how we can do that
  public paint makePaint() {
    return new paint(mouseX, mouseY, sx, sy, c, 2,true,false);
  }
}
