// CSG.scad - Basic example of CSG usage

//translate([-24,0,0]) {
//    union() {
//        cube(15, center=true);
//        sphere(10);
//    }
//}

//intersection() {
//    cube(15, center=true);
//    sphere(10);
//}

//translate([24,0,0]) {
//    difference() {
//        cube(15, center=true);
//        sphere(10);
//    }
//}

//echo(version=version());
// Written by Marius Kintel <marius@kintel.net>
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// You should have received a copy of the CC0 Public Domain
// Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.



difference() {
    color("red")
        translate([0, 0, 0])
            linear_extrude(height=50)
                square([207, 220]); // w/h
            
        
// Spoon Left
    // Rod
    color("blue")
        translate([39, 3, 10])
            linear_extrude(height=40)
                square([22.00, 133.00]);
    
    // Head
    color("blue")
        translate([28, 136, 10])
            linear_extrude(height=40)
                square([44.00, 72.00]);
                    
    // Text
    color("blue")
        translate([34, 20, 45])
            rotate([0, 0, 90])
                linear_extrude(height=45)
                    text("Spoon", font= "Aharoni:style=Bold");
                
                
// Fork    Middle
    // Rod
    color("blue")
        translate([97, 3, 10])
            linear_extrude(height=40)
                square([22.00, 133.00]);
    
    // Head
    color("blue")
        translate([86, 133, 10])
            linear_extrude(height=40)
                square([44.00, 72.00]);
                
    // Text
    color("blue")
        translate([92, 20, 45])
            rotate([0, 0, 90])
                linear_extrude(height=45)
                    text("Fork", font= "Aharoni:style=Bold");
                
                
// Knife     Right
    // Rod
    color("blue")
        translate([149, 3, 10])
            linear_extrude(height=40)
                square([21.00, 132.00]);
    
    // Head
    color("blue")
        translate([149, 105, 10])
            linear_extrude(height=40)
                square([35.00, 108.00]);
              
    // Text
    color("blue")
        translate([144, 20, 45])
            rotate([0, 0, 90])
                linear_extrude(height=45)
                    text("Knife", font= "Aharoni:style=Bold");
}
