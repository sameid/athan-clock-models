module speakerPostMount(size = [ -29, -29, 20 ], sizeOffset = [ -28, -28, 20 ]) {
	difference() {
		translate(size) cylinder(h = 5, r = 5, center = true, $fn = 100);
		translate(sizeOffset) cylinder(h = 10, r = 1.435, center = true, $fn = 100);
	}
}
