public class canvas{
  public PGraphics pg;
  public ArrayList<paint>paintList;
  private boolean enabled; 
  public int count; 
  public int count2;
  public canvas(){
    count = 0;
    enabled = false; 
    paintList = new ArrayList<paint>();
    pg = createGraphics(width,height);
    pg.beginDraw();
    pg.endDraw();
  }
  public void renderImage(tool t){
  }
  public boolean isEnabled(){
    return enabled;
  }
  public void enable(boolean e){
    enabled = e;     
  }
  public void addPaint(paint p){
    paintList.add(p);
  }

}
