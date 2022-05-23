public class canvas{
  private LinkedList<paint>paintList;
  private int toolType;
  private boolean enabled; 
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
