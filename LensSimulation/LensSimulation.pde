int lightSrcX;
int lightSrcY;
int numberOfRays=250;
int rayLength=0;
Ray[] rays;

Lens lens;


void setup(){
  size(800,600);
  drawLens();


}

void draw(){
  if(rays!=null && rays.length>0){
    for(Ray ray:rays){
      ray.NextStep();
    } 
  }
  
}

void drawLens(){
  lens=new Lens(600,300,50,100);
}

void mouseClicked(){
  
  print("Mouse clicked");
  lightSrcX=mouseX;
  lightSrcY=mouseY;
  background(170);
  drawLens();

  rays=new Ray[numberOfRays];
  float angle=2*PI/numberOfRays;
  for(int i=0;i<numberOfRays;i++){
    rays[i]=new Ray(lightSrcX,lightSrcY,i*angle,lens);
  }
  //float angle=PI/12;
  //rays[0]=new Ray(lightSrcX,lightSrcY,angle,lens);
}
