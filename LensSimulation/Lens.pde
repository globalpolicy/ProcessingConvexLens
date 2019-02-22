public class Lens{


  private float x0,y0,a,b;

  public Lens(float x0, float y0, float w, float h){
    this.x0=x0;
    this.y0=y0;
    this.a=w/2;
    this.b=h/2;
    noFill();
    strokeWeight(2);
    ellipse(x0,y0,w,h);
    strokeWeight(1);
    line(0,y0,width,y0);
  }  
  
  public float dy(float x, float y){
    float slope= abs((pow(b,2)/pow(a,2))*((x-x0)/(y-y0)));
    if(y>y0){
      return -slope;//if y is below principal axis, give negative slope
    }
    return slope;
  }
  
  public boolean IsPointInsideLens(float x, float y){
    float det=(pow(x-x0,2))/(a*a)+(pow(y-y0,2))/(b*b);
    if(det<1)
      return true;
    else
      return false;
  }
  
  public boolean IsPointOnLens(float x, float y){
    float det=(pow(x-x0,2))/(a*a)+(pow(y-y0,2))/(b*b);
    if(abs(abs(det)-1)<0.1)
      return true;
    else
      return false;
  }
  
}
