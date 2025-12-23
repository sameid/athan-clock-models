usbCCutOut = import("usbc.stl", convexity = 10);

module mainPostHoles() {

	translate([ -8, -8, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);
	translate([ 48, -8, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);
	translate([ 48, 48, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);
	translate([ -8, 48, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);
}

module backPlate() {

	width = 55.1;
	radius = 17;

	translate([ radius, radius, 0 ]) {

		// Amplifier mount
		ampWidth = 11;
		translate([ .10, (width / 2) - (ampWidth / 2), 0 ]) cube([ 4, ampWidth, 20.71 ]);
		translate([ .10 - 3, (width / 2) - (ampWidth / 2), 20.71 ]) cube([ 7, ampWidth, 4 ]);

		// Arduino mount
		esp32Width = 12.5;
		translate([ width + 10, (width / 2) - (esp32Width / 2), 0 ]) cube([ 4, esp32Width, 26.66 ]);
		translate([ width + 7, (width / 2) - (esp32Width / 2), 26.66 ]) cube([ 7, esp32Width, 4 ]);

		rotate([ 0, 0, 90 ]) translate([ width + 21.5, width - 52, -2 ]) import("usbc.stl", convexity = 10);
		difference() {
			minkowski() {
				cube([ width, width, 2 ]);
				cylinder(h = 1, r = radius, center = false, $fn = 100);
			}

			// mainPostHoles();
			// rotate([ 0, 0, 90 ]) translate([ width + 29, width - 21.64, -3 ]) import("usbc.stl", convexity = 10);
		}
	}
}
