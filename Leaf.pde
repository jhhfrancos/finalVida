class Leaf {

  float xpos;
  float ypos;
  float angle;
  float rot;
  float unitsize;
  float s;
  
  Leaf(float x, float y, float a, float u) {
    //angle = a + 90;
    s = 0;
    angle = a;
    xpos = x;
    ypos = y;
    rot = 0;
    unitsize = u;  
    render();
  };
  
  void render() {
    //if (s<1) {s += 0.1;};
    //noStroke();
    
    //shininess(1);
    
    pushMatrix();
    translate(xpos,ypos);
   
    //fill(0,0,0,0);
    //specular(102, 102, 102); 
    //shininess(255);
    //rot += 0.1;
    //rotateY(rot);
    rotate(-angle * PI/180);
    //scale(s);
    
    //triangle(0,0,unitsize * 3,-3,unitsize * 3,3);
    //ellipseMode(CORNER);
    //ellipse(0,0, unitsize * 3, -6);
    line(0,0,0,unitsize);
    
    popMatrix();
  };
};