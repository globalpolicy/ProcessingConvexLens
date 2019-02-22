public class Ray{

  private int length_=1;
  
  private float x0,y0,x,y;//start x,start y,last x,last y
  private float angle;
  private Lens lens;
  
  private float nextMew=1.5,mew=1;
  
  public Ray(int x, int y, float angle, Lens lens){
    //angle=ACW angle with the horizontal
    this.x0=x;
    this.y0=y;
    this.angle=angle;
    this.lens=lens;
    this.x=(x0+1*cos(angle));
    this.y=(y0-1*sin(angle));
    line(x0,y0,x,y);
  }

  public void NextStep(){
    //length_++;
    updateMew();
    float nextX=(x+length_*cos(angle));
    float nextY=(y-length_*sin(angle));
    line(x,y,nextX,nextY);
    x=nextX;
    y=nextY;
    
  }
  
  private void updateMew(){
    float nextX=(x+length_*cos(angle));
    float nextY=(y-length_*sin(angle));
    
    if(lens.IsPointOnLens(nextX,nextY)){
      
      float lensSlope=lens.dy(nextX,nextY);
      float raySlope=tan(angle);
      float diff=atan((((lensSlope)-(raySlope))/(1+(lensSlope)*(raySlope))));
      if(diff>PI/2){
        diff=PI-diff;
      }
      float incidenceAngle=PI/2-diff;
      float refractionAngle=incidenceAngle-asin(sin(incidenceAngle)/nextMew);
      
      if(!lens.IsPointInsideLens(x,y)){
        
          //if ray is going to hit lens from air
          float deviation=incidenceAngle-refractionAngle;
          if(isRayBelowNormal(lensSlope, nextX, nextY)) //<>//
            angle-=deviation;
          else
            angle+=deviation; //<>//
            
        
      }
      else
      {
        //if ray is going to hit air from lens
        float deviation=refractionAngle-incidenceAngle;
        if(isRayBelowNormal(lensSlope, nextX, nextY))
          angle+=deviation;
        else
          angle-=deviation;
      }
    }
    
    
  }
  
  private boolean isRayBelowNormal(float lensSlope, float lensX, float lensY){
    float normalSlope=1/lensSlope;
    float normalTestY=lensY+normalSlope*this.x-normalSlope*lensX;
    if(this.y>normalTestY)
      return true;
    else
      return false;
  }

}
