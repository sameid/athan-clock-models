module speakerPlateMount() {

	translate([ -20, -20, 0 ]) {

		difference() {
			minkowski() {
				cube([ 40, 40, 2 ]);
				cylinder(h = 1, r = 15, center = false, $fn = 100);
			}

			translate([ -8, -8, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);
			translate([ 48, -8, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);
			translate([ 48, 48, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);
			translate([ -8, 48, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);

			translate([ -1, -1, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);
			translate([ -1, 41, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);
			translate([ 41, -1, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);
			translate([ 41, 41, 0 ]) cylinder(h = 20, r = 1.435, center = true, $fn = 100);

			translate([ 20, 20, 0 ]) cylinder(h = 20, r = 26, center = true, $fn = 100);
		}
	}
}
