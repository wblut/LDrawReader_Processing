class ConditionalLine {
  float x1, y1, z1;
  float x2, y2, z2;
  float tx1, ty1, tz1;
  float tx2, ty2, tz2;
  color col;

  ConditionalLine(float x1, float y1, float z1, float x2, float y2, float z2, float tx1, float ty1, float tz1, float tx2, float ty2, float tz2, color col) {
    this.x1=x1;
    this.y1=y1;
    this.z1=z1; 
    this.x2=x2;
    this.y2=y2;
    this.z2=z2;
    this.tx1=tx1;
    this.ty1=ty1;
    this.tz1=tz1; 
    this.tx2=tx2;
    this.ty2=ty2;
    this.tz2=tz2;
    this.col=col;
  }

  void draw() {
    float sx1, sy1, sx2, sy2, tsx1, tsy1, tsx2, tsy2;
    sx1=screenX(x1, y1, z1);
    sy1=screenY(x1, y1, z1);
    sx2=screenX(x2, y2, z2);
    sy2=screenY(x2, y2, z2);
    tsx1=screenX(tx1, ty1, tz1);
    tsy1=screenY(tx1, ty1, tz1);
    tsx2=screenX(tx2, ty2, tz2);
    tsy2=screenY(tx2, ty2, tz2);  
    
    float s1=(sx2 - sx1)*(tsy1 - sy1) - (sy2 - sy1)*(tsx1 - sx1);
    float s2=(sx2 - sx1)*(tsy2 - sy1) - (sy2 - sy1)*(tsx2 - sx1);
    
    if (s1*s2>=0) {
      stroke(col);
      line(x1, y1, z1, x2, y2, z2);
    }
  }
}