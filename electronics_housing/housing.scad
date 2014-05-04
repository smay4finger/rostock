
// RAMPS mount
for ( p = [
            [15.24, 50.80, 0],
            [96.52,  2.54, 0],
          ])
{
    translate(p) difference() {
        cylinder(h=3, r=3);
        cylinder(h=5, r=1.5);
    }
}

for ( p = [
            [13.97,  2.54, 0],
            [66.04,  7.62, 0],
            [66.04, 35.56, 0],
            [90.17, 50.80, 0]
          ])
{
    translate(p) cylinder(h=3, r=2.6);
    translate(p) cylinder(h=5, r=1.5);
}




cube(size=[200,100,1]);
