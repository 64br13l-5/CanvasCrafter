public class canvas{
  public PGraphics pg;
  public ArrayList<paint>paintList;
  private boolean enabled; 
  public int count; 
  public canvas(){
    count = 0;
    enabled = false; 
    paintList = new ArrayList<paint>();
    pg = createGraphics(width,height);
    pg.beginDraw();
    pg.endDraw();
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
