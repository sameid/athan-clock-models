// clang-format off
use<./speakerMount.scad>
use<./speakerPostMount.scad>
// clang-format on    

eps = 0.01;

module rounded_side_box_outer(size = [ 60, 40, 20 ], r = 4, center = true) {
	minkowski() {
		cube([ size[0] - 2 * r, size[1] - 2 * r, size[2] ], center = center);
		cylinder(r = r, h = eps, center = true, $fn = 100); // rounds in XY only
	}
}

module roundedShell(size = [ 60, 40, 20 ], r = 4, wall = 2, center = true) {
    translate([47, 47, 0]) {
	// Inner needs BOTH: smaller core AND smaller radius for constant thickness
	r2 = max(r - wall, 0.01);

	difference() {
		rounded_side_box_outer(size, r, center);

		// same center, but inset by wall in X/Y (Z unchanged for side-rounding)
		rounded_side_box_outer([ size[0] - 2 * wall, size[1] - 2 * wall, size[2] + 2 * eps ], r2, center);
	}
    }
}

module chassis() {
    roundedShell([ 95, 95, 85 ], r = 20, wall = 2.90);
    // roundedShell([ 76, 76, 65 ], r = 18, wall = 2.90);
    // speakerPostMount([ -29, -29, 22 ], [ -28, -28, 22 ]);
    // speakerPostMount([ -29, 29, 22 ], [ -28, 28, 22 ]);
    // speakerPostMount([ 29, -29, 22 ], [ 28, -28, 22 ]);
    // speakerPostMount([ 29, 29, 22 ], [ 28, 28, 22 ]);
    //
    // speakerPostMount([ -29, -29, -22 ], [ -28, -28, -22 ]);
    // speakerPostMount([ -29, 29, -22 ], [ -28, 28, -22 ]);
    // speakerPostMount([ 29, -29, -22 ], [ 28, -28, -22 ]);
    // speakerPostMount([ 29, 29, -22 ], [ 28, 28, -22 ]);
} 
