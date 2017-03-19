

nivz = 30;

rrou = 26/2; // rayon bague plate base piston
esp = 37; // espace trous fixa
rvr = 5/2; // rayon vis fixa

epx = 8;
epy = 8;

use <Cubo.scad>;

module roulvis(){
	difference() {
		cubo([epx+esp+epx, epy, nivz+rrou+5], [7,8], 15);
		translate([epx+esp/2, -1, nivz]) rotate([-90,0,0]) cylinder(r=rrou+0.5, h=epy+2);
		
		translate([epx, -1, nivz]) rotate([-90,0,0]) cylinder(r=rvr+0.2, h=epy+2);
		translate([epx+esp, -1, nivz]) rotate([-90,0,0]) cylinder(r=rvr+0.2, h=epy+2);
	}

	difference(){
		cube([epx+esp+epx, epy*3, epy]);
		translate([epx, epy*2, -1]) cylinder(r=rvr+0.2, h=epy+2);
		translate([epx+esp, epy*2, -1]) cylinder(r=rvr+0.2, h=epy+2);
	}
}

rotate([90,0,0]) roulvis();
