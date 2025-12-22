module funnyHull(x = 0, y = 0, z = 0) {

	hull() {
		translate([ x, y, z ]) cylinder(h = 20, r = 1, center = true, $fn = 100);
		translate([ x + 4, y, z ]) cylinder(h = 20, r = 1, center = true, $fn = 100);
	}
}

module regularGrillHole(x = 0, y = 0, z = 0, r = 1) { translate([ x + 4, y, z ]) cylinder(h = 20, r = r, center = true, $fn = 100); }

function isEven(n) = n % 2 == 0;

module grillLine(y, isAlternating = false, removeEnds = false) {

	start = removeEnds ? 8 : 0;
	end = removeEnds ? 56 : 64;

	for (i = [start:4:end]) {
		index = i / 4;
		modifier = -16;

		isEven = index % 2 == 0;
		radius = isAlternating ? (isEven ? 1 : 0.6) : (isEven ? 0.6 : 1);

		regularGrillHole(i + modifier, -8 + y, 0, r = radius);
	}
}

module grill() {

	j = 0;
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

			grillLine(-4, true, true);
			grillLine(0, false, true);

			grillLine(4, true);
			grillLine(8, false);
			grillLine(12, true);
			grillLine(16, false);
			grillLine(20, true);
			grillLine(24, false);
			grillLine(28, true);
			grillLine(32, false);
			grillLine(36, true);
			grillLine(40, false);
			grillLine(44, true);
			grillLine(48, false);
			grillLine(52, true);

			grillLine(56, false, true);
			grillLine(60, true, true);
		}
	}
}
