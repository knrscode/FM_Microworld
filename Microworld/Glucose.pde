class Glucose extends Creature{
int timer = 0;  
boolean isdead=false;
boolean iseaten=false;
  FoodThought myThought;

  public Glucose(int x,int y, int r, FoodThought ft) {
    super(x, y, r);
    myThought = ft;
    ellipseMode(RADIUS);
  }  
  
  public void draw_shape(){
    timer++;
    if(iseaten) {
      fill(255,255,0,80);
    } else {
      fill(255,0,0,80);
    }
    noStroke();
    ellipse(position().x, position().y, radius(), radius());  
    if(timer>=180) {
      isdead=true;
    }
  }

  public boolean inside(int mx, int my, float mr) {    
    if(dist(mx, my, position().x, position().y) < radius() + mr) return true;
    return false;
  }
  
  
  
};
