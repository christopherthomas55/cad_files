STRUCTURE_HEIGHT = 90;
STRUCTURE_DIAMETER = 150;

SPONGE_WIDTH = 105;
SPONGE_HEIGHT = 755;
SPONGE_HOLDER_W = 5;
BRUSH_HEIGHT = 52;

BRUSH_DIAMETER = 29;
WIRE_DIAMETER = 8;
LEANS = 8;
YOFFSET = STRUCTURE_DIAMETER/5 + 2;
XOFFSET = STRUCTURE_DIAMETER/8;
WIRE_Z_OFFSET = 15;


$fn = 100;

difference(){

    hull() {
        cylinder(h=STRUCTURE_HEIGHT, d=STRUCTURE_DIAMETER);
        translate([0, 0, STRUCTURE_HEIGHT]) rotate_extrude() translate([STRUCTURE_DIAMETER/2 - 2, 0]) circle(r=2);
    }

    
    // Want a bit of a bowl
    translate([-(SPONGE_WIDTH + 2*SPONGE_HOLDER_W)/2, 0, 40])
        linear_extrude(STRUCTURE_HEIGHT)
            square([SPONGE_WIDTH + 2*SPONGE_HOLDER_W, SPONGE_HEIGHT + 50]);

    // Sponge
    translate([-SPONGE_WIDTH/2, 0, 30])
        linear_extrude(STRUCTURE_HEIGHT)
            square([SPONGE_WIDTH, SPONGE_HEIGHT]);

    //Brush Thing, rotate 1 degree to it leans
    translate([-XOFFSET, -YOFFSET, (STRUCTURE_HEIGHT - BRUSH_HEIGHT)])
        rotate([0, -LEANS, 0])
            linear_extrude(STRUCTURE_HEIGHT)
                circle(BRUSH_DIAMETER);
    

    //Wire Thing, rotate 1 degree to it leans
    translate([XOFFSET + 5, -YOFFSET, WIRE_Z_OFFSET])
        rotate([0, LEANS, 0])
            linear_extrude(STRUCTURE_HEIGHT)
                circle(WIRE_DIAMETER);
}






