

include <Hexa.scad>;
use<Cubo.scad>;

$fn = 12;

ep = 8;
es = 3; // entre ecrous x
ey = 8; // ecrou <> bord y

dix = 22; // vis serrage <> bas de piece
j= 0.2;

module axe(jret=0) difference(){
	cube([(es+j+m8h+j)*3+dix, ey+j+m8k+j+ey, ep], [1,4], ep/3);
	
	// tige
	translate([-1, ey+j+m8k/2, ep]) rotate([0,90,0]) cylinder(r=4+j, h=(es+j+m8h+j)*3+es+1);
	// ecrous
	translate([es, ey+j+m8k/2, ep]) rotate([0,90,0]) cylinder(r=m8r+j, h=j+m8h+j, $fn=6);
	translate([(es+j+m8h+j)+es, ey+j+m8k/2, ep]) rotate([0,90,0]) cylinder(r=m8r+j, h=j+m8h+j, $fn=6);
	translate([(es+j+m8h+j)*2+es, ey+j+m8k/2, ep]) rotate([0,90,0]) cylinder(r=m8r+j, h=j+m8h+j, $fn=6);
	
	// vis serrages
	translate([es+m8h/2, ey/2, -1]) cylinder(r=1.7, h=ep+2);
	translate([es+m8h/2, ey+j+m8k+j+ey/2, -1]) cylinder(r=1.7, h=ep+2);
	
	translate([(es+j+m8h+j)*1+es+m8h/2, ey/2, -1]) cylinder(r=1.7, h=ep+2);
	translate([(es+j+m8h+j)*1+es+m8h/2, ey+j+m8k+j+ey/2, -1]) cylinder(r=1.7, h=ep+2);
	
	translate([(es+j+m8h+j)*2+es+m8h/2, ey/2, -1]) cylinder(r=1.7, h=ep+2);
	//translate([(es+j+m8h+j)*2+m8h/2, ey+j+m8k+j+ey/2, -1]) cylinder(r=1.7, h=ep+2);
	translate([(es+j+m8h+j)*3+es+m8h/2, ey/2, -1]) cylinder(r=1.7, h=ep+2);
	
	// trunc base
	translate([(es+j+m8h+j)*3+dix, -jret, -1]) rotate([0,0,45]) cube([lcx, lcy, ep*2]);
	
}

lcx = 27;  // cube porte lame
lcy = 50;
epco = 2;

module lame() difference(){
	union() {
		translate([(es+j+m8h+j)*3+dix, 0,0]) rotate([0,0,45]) cube([lcx, lcy, ep], [1,4], ep/3);
		// corniche
		translate([(es+j+m8h+j)*3+dix, 0,0]) rotate([0,0,45]) cube([2, lcy, ep+2]);
		
	}
	// trous fixator
	translate([(es+j+m8h+j)*3+dix, 0,0]) rotate([0,0,45]) {
		lx1 = epco+3;
		ly1 = 12;
		ly2 = 40;
		lx2 = epco + 19 + 1.7;
		hull(){
			translate([lx1, ly1, -1]) cylinder(r=1.7, h=ep*2);
			translate([lx1, ly2, -1]) cylinder(r=1.7, h=ep*2);
		}
		translate([lx2, 25, -1]) cylinder(r=1.7, h=ep*2);
		translate([lx2, 43, -1]) cylinder(r=1.7, h=ep*2);
	}
	
	// surface
	translate([(es+j+m8h+j)*3+dix+5, -1,-1])  cube([lcx, lcy, ep+2]);
}

module surlame(){
	
	translate([(es+j+m8h+j)*3+dix, 0,0]) rotate([0,0,45]) {
		
		difference(){
			translate([epco+j, 0, 0]) cubo([lcx-epco-j, lcy, 2], [12], 28.5); // cube surlame
			//
			lx1 = epco+3;
			ly1 = 12;
			ly2 = 40;
			lx2 = epco + 19 + 1.7;
			hull(){
				translate([lx1, ly1, -1]) cylinder(r=1.7, h=ep*2);
				translate([lx1, ly2, -1]) cylinder(r=1.7, h=ep*2);
			}
			translate([lx2, 25, -1]) cylinder(r=1.7, h=ep*2);
			translate([lx2, 43, -1]) cylinder(r=1.7, h=ep*2);
			
		}
	}
}
	

//axe();
// translate([0,0,ep*2]) mirror([0,0,1]) axe(0.5);
//lame();
translate([0,0,ep+1]) surlame();

// print
// translate([0,-3,0]) rotate([180,0,0]) mirror([0,0,1]) axe(0.5);


