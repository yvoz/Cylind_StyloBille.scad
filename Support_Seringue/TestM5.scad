

include <Hexa.scad>;

rotate([90,0,0]) difference(){
	translate([-7,-7,0]) cube([14,14, m5h+6]);
	translate([0,0,0]) cylinder(r=2.5+0.3, h=15, $fn=12);
	translate([0,0,3]) cylinder(r=m5r+0.4, h=m5h+0.1, $fn=6);
	translate([-m5r,0,3]) cylinder(r=m5r+0.4, h=m5h+0.1, $fn=6);
}