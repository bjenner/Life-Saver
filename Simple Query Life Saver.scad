// Parameters for the lifesaver
diameter = 100;     // Overall diameter
thickness = 20;     // Thickness of the ring
hole_diameter = 60; // Diameter of the central hole

// Create the outer cylinder
difference() {
    cylinder(h = thickness, d = diameter, $fn=100);

    // Subtract the inner cylinder to create the hole
    translate([0, 0, -1]) // Slightly lower the inner cylinder to ensure complete subtraction
        cylinder(h = thickness + 2, d = hole_diameter, $fn=100);
}

// Tilt the lifesaver
rotate([30, 0, 45]) // Adjust the angles here for the desired tilt
    translate([0, 0, diameter/2])
        difference() {
            cylinder(h = thickness, d = diameter, $fn=100);
            translate([0, 0, -1])
                cylinder(h = thickness + 2, d = hole_diameter, $fn=100);
        }
