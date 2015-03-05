
class Smaller extends Creature {
  
  boolean ismarried=false;
  
   public Smaller(int x,int y, int r) {
    super(x, y, r);
    ellipseMode(RADIUS);
  }  
  
  public void draw_shape(){
    noFill();
    ellipse(position().x, position().y, radius(), radius());  
  }

  public boolean inside(int mx, int my) {    
    if(dist(mx, my, position().x, position().y) < 2*radius()) return true;
    return false;
  }
   
}
  
