

Lsystem ls = new Lsystem("X");
RuleSet rs = new RuleSet();
Engine e = new Engine(150, 600, 25.0, -5);

Lsystem ls2 = new Lsystem("X");
RuleSet rs2 = new RuleSet();
Engine e2 = new Engine(300, 600, 45.0, -3);

int value = 0; 
boolean playing = false;
int count = 0;
Leaf[] leaves = new Leaf[5000];
int leafcount;
float rot = 0.0;
 

void setup() {
  size(700,700,P2D);
  //framerate(60);
 
  leafcount = 0;
  
  rs.init();
  rs2.init();
  
  String[] rax1 = {"FF:100"};
  String[] rax2 = {"F-[[X]+X]+F[+FX]-X:100"};
  String[] rax3 = {"FF:100"};
  String[] rax4 = {"F[+X]-X:100"};
  //String[] rax = {"+[FF]+:90", "FFF:10"};
  Rule r1 = new Rule("F", rax1);
  Rule r2 = new Rule("X", rax2);
  Rule r3 = new Rule("F",rax3);
  Rule r4 = new Rule("X",rax4);
  
  rs.addRule(r2);
  rs2.addRule(r3);
  
  rs.addRule(r1);
  rs2.addRule(r4);
  
  ls.registerRuleSet(rs);
  ls2.registerRuleSet(rs2);
  
  ls.registerEngine(e);
  ls2.registerEngine(e2);
  println("ls1");
  ls.recurse(6);
  println("ls2");
  ls2.recurse(7);
  
  //print(ls2.eng);
};

void draw() {
  background(255);
  //lights();
  count ++;
  if (!playing) {
    ls.render();
    ls2.render();
  };
  int i = 0;
  while (i<leafcount) {
    leaves[i].render();
    i++;
  };
};

void mousePressed() {
  //setup();
  playing = !playing;
};