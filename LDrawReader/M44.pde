class M44{
 float x,y,z;
 float a,b,c,d,e,f,g,h,i;
 
 M44(){
  this.x=0;
  this.y=0;
  this.z=0;
  this.a=1;
  this.b=0;
  this.c=0;
  this.d=0;
  this.e=-1;//-y is up in LDraw convention
  this.f=0;
  this.g=0;
  this.h=0;
  this.i=1; 
 }
 
 M44(float x, float y, float z, float a, float b, float c, float d, float e, float f, float g, float h, float i){
  this.x=x;
  this.y=y;
  this.z=z;
  this.a=a;
  this.b=b;
  this.c=c;
  this.d=d;
  this.e=e;
  this.f=f;
  this.g=g;
  this.h=h;
  this.i=i; 
 }
 
 M44 mul(M44 M){
   return new M44(
   x*M.a+y*M.b+z*M.c+M.x,
   x*M.d+y*M.e+z*M.f+M.y,
   x*M.g+y*M.h+z*M.i+M.z,
   
   a*M.a+d*M.b+g*M.c,
   b*M.a+e*M.b+h*M.c,
   c*M.a+f*M.b+i*M.c,
   a*M.d+d*M.e+g*M.f,
   b*M.d+e*M.e+h*M.f,
   c*M.d+f*M.e+i*M.f,
   a*M.g+d*M.h+g*M.i,
   b*M.g+e*M.h+h*M.i,
   c*M.g+f*M.h+i*M.i);
 }
  
}