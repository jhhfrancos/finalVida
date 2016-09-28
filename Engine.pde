class Engine {
  float xpos;
  float ypos;
  float angle;
  float unitsize;
  float anglechange;
  float[] xpos_a;
  float[] ypos_a;
  float[] angle_a;
  int acount;
  
  Engine(float x, float y, float a, float u) {
    xpos = x;
    ypos = y;
    angle = 0;
    anglechange = a;
    unitsize = u;
    
    xpos_a = new float[1000];
    ypos_a = new float[1000];
    angle_a = new float[1000];
    
    acount = 0;
  };
  
  void init() {
  
  };
  
  void process(char c) {
    if (c == '+') {
      angle += anglechange;
    }
    else if (c == '-') {
      angle -= anglechange;
    }
    else if (c == 'F') {
       float us = unitsize;
       
       float tx = xpos;
       float ty = ypos;
       //line(xpos, ypos, tx, ty);
       
       
       Leaf l = new Leaf(tx,ty,angle,us);
       leaves[leafcount] = l;
       leafcount ++;
       xpos = xpos + unitsize * sin(angle * PI/180);
       ypos = ypos + unitsize * cos(angle * PI/180);
       //unitsize = 3*unitsize / 2;
    }
    else if (c =='[') {
      xpos_a = append(xpos_a, xpos);
      ypos_a = append(ypos_a, ypos);
      angle_a = append(angle_a, angle);
    }
    else if (c ==']') {
      xpos = xpos_a[xpos_a.length - 1];
      ypos = ypos_a[ypos_a.length - 1];
      angle = angle_a[angle_a.length - 1];
      
      xpos_a = shorten(xpos_a);
      ypos_a = shorten(ypos_a);
      angle_a = shorten(angle_a);
      
      
    };
  // return(false);
  };
  
};