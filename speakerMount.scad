module speakerPlateMount() {

	width = 55.1;
	positionX = width / 2;
	radius = 17;

	translate([ radius, radius, 0 ]) {

		difference() {
			minkowski() {
				// cube([ 40, 40, 2 ]);
				cube([ width, width, 2 ]);
				cylinder(h = 1, r = radius, center = false, $fn = 100);
			}

			// translate([ -8, -8, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);
			// translate([ 48, -8, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);
			// translate([ 48, 48, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);
			// translate([ -8, 48, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);

			translate([ positionX - 21, positionX - 21, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);
			translate([ positionX - 21, positionX + 21, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);
			translate([ positionX + 21, positionX - 21, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);
			translate([ positionX + 21, positionX + 21, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);

			translate([ positionX, positionX, 0 ]) cylinder(h = 20, r = 26, center = true, $fn = 100);
		}
	}
}
