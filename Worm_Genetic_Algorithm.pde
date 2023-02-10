//imports a library for sorting my array
import java.util.*;

//grid and food variables
float gridx, gridy, spacing;
int foodx, foody;

// || SET LIFESPAN HERE ||
int lifeSpan = 100;

//establishes the population and pvector for their end goal
PVector end;
Population p;

void setup() {
  size(500, 775);
  
  // || SET FRAMERATE HERE, SLOW DOWN FOR COOLER VISUAL ||
  frameRate(20);
  
  //spacing and x and y for food
  spacing = 25;
  foodx = floor(random(0, 20))*25;
  foody = floor(random(20,30))*25;
  
  //creates the population and PVector for the end goal
  //                 V  || CHANGE POPULATION SIZE HERE ||
  p = new Population(25, 0.01);
  end = new PVector(foodx, foody);
}

void draw() {
  background(135, 206, 250);

  //ground visual
  rectMode(CENTER);
  fill(155, 118, 83);
  noStroke();
  rect(250, 450, 500, 650);

  //grid visual
  
  stroke(120, 80, 39);
  strokeWeight(3);

  gridx = 25;
  while (gridx<width) {
    line(gridx, 125, gridx, 800);
    gridx = gridx+spacing;
  }  
  gridy = 25;
  while (gridy<height) {
    line(0, gridy+100, width, gridy+100);
    gridy = gridy+spacing;
  }
  
  //food visual
  stroke(82, 54, 27);
  rectMode(CENTER);
  fill(255,255,0);
  rect(foodx, foody, 15, 15);
  
  //displays population
  p.live();
  
}
