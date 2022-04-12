PAW_W = 34;
WALL_THICC = 4; // Maybe Increase this and PAW_W
TOTAL_HEIGHT = 34; // Toy with this

N_CELLS = 6; //Must be even. Effects choices for i and j


floor_h = WALL_THICC;
mblock_w = PAW_W + WALL_THICC;



module maze_block(xpos, ypos, wall_vector, inside_type) { 
        // wall_vector is binary up, left, down, right
        // inside_type 0 = nothing, 1 = 4 larger spheres, 2 = lots of small spheres  

    //gen walls
    difference() {
    // "Base" Square, we make next smaller on walls we want to keep and raise
    // it
    translate([xpos, ypos, 0]) 
        linear_extrude(TOTAL_HEIGHT)
            square(mblock_w);

    // "Base" Square, we make smaller on walls we want to keep
    translate([xpos - .1 + WALL_THICC*wall_vector[1], ypos -.1 + WALL_THICC*wall_vector[2], floor_h]) 
        linear_extrude(TOTAL_HEIGHT)   //Extend farther past for clean model
            square([mblock_w + 1 - WALL_THICC *(wall_vector[1] + wall_vector[3]),
            mblock_w + 1 - WALL_THICC *(wall_vector[0] + wall_vector[2])]);
    }

    if (inside_type==1){
        for(i=[1:2])
            for(j=[1:2])
                translate([xpos + i*mblock_w/3, ypos + j*mblock_w/3, -3])
                    sphere(mblock_w/4);
    }

    if (inside_type==2){
        for(i=[1:6])
            for(j=[1:6])
                translate([xpos + i*mblock_w/7, ypos + j*mblock_w/7, 0])
                    sphere(mblock_w/8);
    }

};

//maze_block(0, 0, [0, 1, 1, 0], 1);
//maze_block(-20, 0, [0, 1, 1, 0], 0);

//// Name minkowski makes it smooth, only do at end
intersection(){
union(){
  $fn=30;
  minkowski()
  {
    translate([2.4*PAW_W, 2.6*PAW_W, 0])
        linear_extrude(height=floor_h+2)
            text("CJ", font= "Aharoni:style=Bold", size=30);

    sphere(r=1);

  }



// Spiral pattern, I'm sure there's more clever ways but this is fastest.Also
// not generalized

// Center square
for (i= [2:3])
    for (j=[2:3])
        maze_block(i*PAW_W, j*PAW_W, [j>=3 ? 1:0, i<=2 ? 1:0, j<=2 && i>2 ?  1:0, i>=3 ? 1:0], 0);

// Bottom left corners
for (i=[0:1])
    maze_block((i+1)*PAW_W, i*PAW_W, [0, 1, 1, 0], 1);

// Top left corners
for (i=[0:1])
    maze_block((i)*PAW_W, (5-i)*PAW_W, [1, 1, 0, 0], 1);

// Top right corners
for (i=[0:1])
    maze_block((i+ 4)*PAW_W, (i + 4)*PAW_W, [1, 0, 0, 1], 1);
    
// Bottom right corners
for (i=[0:1])
  maze_block((i+4)*PAW_W, (1-i)*PAW_W, [0, 0, 1, 1], 1);


// Left walls
for (i=[0:1])
    for (j=[0:3+2*i-1])
        maze_block((1-i)*PAW_W, (j +  (1-i))*PAW_W, [0, 1, 0, 0], 2);
//
// Right walls
for (i=[0:1])
    for (j=[0:2+2*i-1])
        maze_block((4+i)*PAW_W, (j + (2-i))*PAW_W, [0, 0, 0, 1], 2);

//Bottom Walls
for (j=[0:1])
  for (i=[0:0+2*j])
      maze_block((3+i - j)*PAW_W, (1-j)*PAW_W, [0, 0, 1, 0], 2);

//Top Walls
for (j=[0:1])
    for (i=[0:1+2*j])
        maze_block((2+i - j)*PAW_W, (4+j)*PAW_W, [1, 0, 0, 0], 2);
};

    linear_extrude(height=TOTAL_HEIGHT) square(240);
}
