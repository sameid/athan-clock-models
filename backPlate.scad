usbCCutOut = import("usbc.stl", convexity = 10);

module mainPostHoles() {

	translate([ -8, -8, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);
	translate([ 48, -8, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);
	translate([ 48, 48, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);
	translate([ -8, 48, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);
}

module backPlate() {

	// Amplifier mount
	translate([ -35 + 12.10, -5.5, 0 ]) cube([ 4, 11, 20.71 ]);
	translate([ -38 + 12.10, -5.5, 20.71 ]) cube([ 7, 11, 4 ]);

	// Arduino mount
	translate([ 30, -6.25, 0 ]) cube([ 4, 12.5, 26.66 ]);
	translate([ 27, -6.25, 26.66 ]) cube([ 7, 12.5, 4 ]);

	translate([ -20, -20, 0 ]) {

		difference() {
			minkowski() {
				cube([ 40, 40, 2 ]);
				cylinder(h = 1, r = 15, center = false, $fn = 100);
			}

			mainPostHoles();
			rotate([ 0, 0, 90 ]) translate([ 69, 18.36, -3 ]) import("usbc.stl", convexity = 10);
		}
	}
}
