import teilchen.*;
import mathematik.*;
import teilchen.util.CollisionManager;
import teilchen.force.ViscousDrag;


SugarColony sugar;
Physics physics;
CollisionManager collision;

int r = 20;

void setup(){
  size(650,650);
  background(23, 68, 250);
  frameRate(30);
  
  physics = new Physics();
  collision = new CollisionManager();
  collision.minimumDistance(r*2);
  
  sugar= new SugarColony(physics,collision,r);
  
  sugar.sugary();
  
  // create a global drag
  ViscousDrag drag = new ViscousDrag();
  drag.coefficient = 0.75f;
  physics.add(drag);  
  
}

void draw(){
  
  collision.createCollisionResolvers();
  collision.loop(1.0 / frameRate);
  
  background(23, 68, 250);
  sugar.drawSugar();
  physics.step(1.0 / frameRate); 
  
  collision.removeCollisionResolver();
    
}


