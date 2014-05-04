$fn = 100;
$fa = 0.1;

baseHeight = 1;
spacerHeight = 4;
boltHeight = 3;


mountingBolts = [
    [13.97,  2.54, 0], 
    [66.04,  7.62, 0],
    [66.04, 35.56, 0],
    [90.17, 50.80, 0],
];

mountingHoles = [
    [15.24, 50.80, 0], 
    [96.52,  2.54, 0],
];

// RAMPS mount
c1h = baseHeight + spacerHeight;
c2h = baseHeight + spacerHeight + boltHeight;

translate([-10, 4.5, 0]) {
    for ( p = mountingHoles) {
        translate(p) difference() {
            cylinder(h=c1h, r=3);
            cylinder(h=c1h, r=1.5);
        }
    }
    for ( p = mountingBolts) {
        translate(p) cylinder(h=c1h, r=2.6);
        translate(p) cylinder(h=c2h, r=1.5);
    }
}

// Fan Mount
module mountBracket() {
    difference() {
        cube(size=[2.4, 12.4, 10]);
        translate([-1, 5, 5])rotate([0, 90, 0])
            cylinder(r=2, h=4);
    }
    translate([12.4, 10, 0]) rotate([90, 0, 180])
        linear_extrude(height=2.4) polygon([[0, 0], [10, 0], [10, 10]]);
}

translate([110, 0, 0]) mirror() mountBracket();
translate([110, 60, 0]) rotate([0, 0, 180]) mountBracket();

cube(size=[110,60,0.10]);
