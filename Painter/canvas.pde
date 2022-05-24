public class canvas{
  public LinkedList<paint>paintList;
  private boolean enabled; 
  public int count; 
  public canvas(){
    enabled = false; 
    paintList = new LinkedList<paint>();
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
  public LinkedList getPaintList(){
    return paintList;
  }
}
