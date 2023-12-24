// Parameters for the lifesaver
diameter = 100;         // Overall diameter of the lifesaver
thickness = 20;         // Thickness of the lifesaver ring
hole_diameter = 60;     // Diameter of the central hole
bezel_width = 5;        // Width of the bezel around the lifesaver
letter_height = 2;      // Height of the raised letters

// Function to create the ring shape
module ring(d, t, hd) {
    difference() {
        cylinder(h = t, d = d, $fn=100);
        translate([0, 0, -1])
            cylinder(h = t + 2, d = hd, $fn=100);
    }
}

// Function to add raised letters
module letters() {
    // Placeholder for letters - use text() function for actual letters
    translate([diameter/2 - 10, 0, thickness/2 + 0.1])
        linear_extrude(height = letter_height)
            text("LIFE SAVER", size = 10, valign = "center", halign = "center");
}

// Main lifesaver with bezel
difference() {
    // Outer ring
    ring(diameter + 2 * bezel_width, thickness + bezel_width, hole_diameter - 2 * bezel_width);

    // Inner ring (subtract to create the bezel)
    translate([0, 0, bezel_width/2])
        ring(diameter, thickness, hole_diameter);
}

// Add letters
translate([0, 0, bezel_width])
    letters();

// Tilt the lifesaver
rotate([30, 0, 45])
    translate([0, 0, (diameter + 2 * bezel_width)/2])
        difference() {
            ring(diameter + 2 * bezel_width, thickness + bezel_width, hole_diameter - 2 * bezel_width);
            translate([0, 0, bezel_width/2])
                ring(diameter, thickness, hole_diameter);
            letters();
        }

