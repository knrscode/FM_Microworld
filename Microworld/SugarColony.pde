import java.util.Iterator;

class SugarColony implements CreatureBehavior{
  
  CollisionManager _collision;
  Physics _physics;
  
  int initG = 2;
  int initS = 4;
  int radius = 0;
  
  ArrayList<Glucose> glu=new ArrayList<Glucose>();
  ArrayList<Smaller> smal=new ArrayList<Smaller>();
   
  public SugarColony(Physics p, CollisionManager c, int radius) {
    _physics = p;
    _collision = c;
    this.radius = radius;
  }
  
  public void add(Creature c) {
    
    _physics.add(c);
    if(c instanceof Smaller) {
      _collision.collision().add(c);
    }
 }
  
  public void event(int x, int y)  {;}
 
  public void event(int c) {;}
  
  public void update(float dt) {;}  
 
  void sugary(){
    for(int i=0;i<initG;i++){
         int a=(int)random(width);
         int b=(int)random(height);
         FoodThought _foodthought=new FoodThought();
        _foodthought.radius(450);
        _foodthought.strength(100);
        _foodthought.position().set(a, b);
        _physics.add(_foodthought);
    
        Glucose _glucose=new Glucose(a,b,radius/3, _foodthought);
        add(_glucose);
        glu.add(_glucose);
    }
    for(int j=0;j<initS;j++){
        Smaller _smaller=new Smaller((int)random(width),(int)random(height),radius);
        add(_smaller);
        smal.add(_smaller);
    }
  }
  
  void drawSugar(){
    //removal of glucose + attractor;
    Iterator<Glucose> it = glu.iterator();
    while(it.hasNext()) {
       Glucose gliIt = it.next();
       if(gliIt.isdead) {
         _physics.remove(gliIt.myThought);
         _physics.remove(gliIt);
         it.remove();
       } 
    }
    
    for(int i = 0; i < glu.size(); i++) {
      Glucose localRef = glu.get(i);
      localRef.draw_shape();
    }
    for(int i=0;i<smal.size();i++){
      Smaller localref2 = smal.get(i);
      localref2.draw_shape();
    
    }
    if(frameCount%90 ==0){
         int a=(int)random(width);
         int b=(int)random(height);
         FoodThought _foodthought=new FoodThought();
        _foodthought.radius(450);
        _foodthought.strength(100);
        _foodthought.position().set(a, b);
        _physics.add(_foodthought);
        
        Glucose _glucose=new Glucose(a,b,radius/3, _foodthought);
        add(_glucose);
        glu.add(_glucose);
    
    }
    
//     _foodthought.position().set(mouseX, mouseY);
//     
//    noFill();
//    stroke(255,255,0);
//    ellipse(_foodthought.position().x, _foodthought.position().y, _foodthought.radius(), _foodthought.radius());


  }
    
}

