
import teilchen.force.Attractor;

public class FoodThought extends Attractor{

    public FoodThought() {
       super();
    }
   
    public void apply(float theDeltaTime, Physics theParticleSystem) {
        if (_myStrength != 0) {
            for (final Particle myParticle : theParticleSystem.particles()) {
                /* each particle */
                if (!myParticle.fixed() && myParticle instanceof Smaller) {
                    myTemp.sub(_myPosition, myParticle.position());
                    final float myDistance = fastInverseSqrt(1 / myTemp.lengthSquared());
                    if (myDistance < _myRadius) {
                        float myFallOff = 1f - myDistance / _myRadius;
                        final float myForce = myFallOff * myFallOff * _myStrength;
                        myTemp.scale(myForce / myDistance);
                        if (!myParticle.fixed()) {
                            myParticle.force().add(myTemp);
                        }
                    }
                }
            }
        }
    }


}

