class Glucose extends Creature{
int timer = 0;  
boolean isdead=false;

  FoodThought myThought;

  public Glucose(int x,int y, int r, FoodThought ft) {
    super(x, y, r);
    myThought = ft;
    ellipseMode(RADIUS);
  }  
  
  public void draw_shape(){
    timer++;
    fill(255,0,0,80);
   ellipse(position().x, position().y, radius(), radius());  
    if(timer>=180) {
      isdead=true;
    }
  
}
  public boolean inside(int mx, int my) {    
    if(dist(mx, my, position().x, position().y) < radius()) return true;
    return false;
  }
  
};
