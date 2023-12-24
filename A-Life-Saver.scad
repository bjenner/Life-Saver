// Parameters for the life saver
diameter = 29.5;     // Overall diameter
thickness = 7;     // Thickness of the ring
hole_diameter = 8.5; // Diameter of the central hole

// Create the outer cylinder
difference() {
    cylinder(h = thickness, d = diameter, center=true, $fn=100);

    // Subtract the inner cylinder to create the hole
    translate([0, 0, -1]) // Slightly lower the inner cylinder to ensure complete subtraction
        cylinder(h = thickness + 2, d = hole_diameter, center=true, $fn=100);
}

module torus(r1 = 3,r2 = 3,fn = 10){
   for (i = [1: fn]){
        rotate([90,0,360 / fn * i])
        translate([r1 ,0,0])
        cylinder(h = 2 * (r1 + r2) * 3.14 / fn,
                 r = r2,
                 center = true,
                 $fn = fn);
       }
}
torus(r1 = 9.5,r2 = 5.2,fn = 100);

use <text_on_OpenSCAD/text_on.scad>

r=15;

translate([0,0,4.5])
text_on_circle(t="LIFE SAVER",
                spacing=1.3,
                size=5,
                font="forum",
                r=r, 
               direction="ltr", 
               middle=r/3);

