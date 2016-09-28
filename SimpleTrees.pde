class Lsystem {
  
  String axiom;
  int rc, rm, renderindex, rint, rendercount;
  char[] sa;
  RuleSet ruleset;
  Engine eng;
  Lsystem(String axiom) {
    this.axiom = axiom;
    rc = 0;
    rendercount = 0;
    renderindex = 0;
  };
  
  void registerRuleSet(RuleSet rs) {
    ruleset = rs;
  };
  
  void registerEngine(Engine the_e) {
    eng = the_e;
  };
  
  void recurse(int maxi) {
    rm = maxi;
    rc ++;
    
    sa = axiom.toCharArray();
    String[] ta = new String[sa.length];
    
    for (int n=0; n<sa.length; n++) {
      String replace = ruleset.runRule(sa[n]);
      ta[n] = replace;
    };
    
    axiom = join(ta, "");
    println(axiom); //<>//
    if (rc < rm) {
      recurse(rm);
    }
    else {
      rc = 0;
    }; 
  };
  
  
  void render() {
      //rendercount = step;
      doRender();
  };
  
  void doRender() {
      renderindex ++;
      if(renderindex < axiom.length()){
        eng.process(axiom.charAt(renderindex)); //<>//
        //print("pintando: " + axiom.charAt(renderindex));
      }
  };
};