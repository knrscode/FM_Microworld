
class Smaller extends Creature {
  // declared an object reference
  private Smaller partner;
  float s;
  
  boolean ismarried=false;
  
   public Smaller(int x,int y, int r) {
    super(x, y, r);
    s = (float)Math.sqrt(2)*r;
    ellipseMode(RADIUS);
  }  

  public void draw_shape(){
    noFill();
    stroke(255,255,255);
    //ellipse(position().x, position().y, radius(), radius()); 
    //ellipse(position().x, position().y, radius()/2, radius()/2); 
    
    pushMatrix();
    translate(position().x, position().y);
    stroke(0,255,0);
    beginShape();
    vertex(-s/2, -s/2);
    vertex(s/2, -s/2);
    vertex(s/2, s/2);
    vertex(-s/2, s/2);
    endShape(CLOSE);
    rotate(radians(60));
    beginShape();
    vertex(-s/2, -s/2);
    vertex(s/2, -s/2);
    vertex(s/2, s/2);
    vertex(-s/2, s/2);
    endShape(CLOSE);
    rotate(radians(60));
    beginShape();
    vertex(-s/2, -s/2);
    vertex(s/2, -s/2);
    vertex(s/2, s/2);
    vertex(-s/2, s/2);
    endShape(CLOSE);
    popMatrix();
    
  }

  public boolean inside(int mx, int my) {    
    if(dist(mx, my, position().x, position().y) < 2*radius()) return true;
    return false;
  }
  // passing reference of  whom the object is married to, to be able to create a spring.
  void getMarried(Smaller smaller){
    // passing the address of smaller to partner
    partner=smaller;
    ismarried=true;    
  }
  
  public Smaller getMyPartner() {
    if(ismarried) {
      return partner; 
    } else {
      return null; 
    }
  }
   
}
  
