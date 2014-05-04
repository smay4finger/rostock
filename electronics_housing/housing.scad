$fn = 100;
$fa = 0.1;

baseHeight = 4;
spacerHeight = 2;
boltHeight = 1;


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

c1h = baseHeight + spacerHeight;
c2h = baseHeight + spacerHeight + boltHeight;

difference() {
    union() {
        // RAMPS mount

        translate([-8, 5.9, 0]) {
            for ( p = mountingHoles) {
                translate(p) difference() {
                    cylinder(h=c1h, r1=5, r2=2.5);
                    cylinder(h=c1h, r=1.4);
                }
            }
            for ( p = mountingBolts) {
                translate(p) cylinder(h=c1h, r1=5, r2=2.5);
                translate(p) cylinder(h=c2h, r=1.0);
            }
        }

        cube(size=[110,64.8,baseHeight]);
        cube(size=[110, 2.4, 10]);
        translate([0, 62.4, 0]) cube(size=[110, 2.4, 10]);
        translate([107.6, 0, 0]) cube(size=[2.4, 64.8, 10]);
    }
    translate([-8, 5.9, -1]) {
        for ( p = mountingHoles) {
            translate(p) difference() {
                cylinder(h=10, r=1.4);
            }
        }
    }
    translate([108.8, 32.4, 30]) sphere(r=28);
}

