public class canvas{
  public LinkedList<paint>paintList;
  private boolean enabled; 
  public canvas(){
    enabled = true; 
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
