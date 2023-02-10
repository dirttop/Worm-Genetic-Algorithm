class DNA {
  int [] genes;
  
  DNA() { 
    genes = new int[lifeSpan];
    
    for(int i = 0; i < lifeSpan; i++) {
       int d = floor(random(0,4));
       genes[i] = d;
    }
  }
  
}
