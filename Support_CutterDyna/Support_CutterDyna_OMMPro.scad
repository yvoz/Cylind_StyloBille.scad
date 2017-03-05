
include <Hexa.scad>;
use<Cubo.scad>;

ep = 7;
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

lcx = 27;
lcy = 50;
// 47; // coté du carré pointe <> pointe
//lvx = 16; // x vis 
//lvy = 11; // y vis

module lame() difference(){
	union() {
		translate([(es+j+m8h+j)*3+dix, 0,0]) rotate([0,0,45]) cube([lcx, lcy, ep], [1,4], ep/3);
		// corniche
		translate([(es+j+m8h+j)*3+dix, 0,0]) rotate([0,0,45]) cube([2, lcy, ep+2]);
	}
	// trous fixator
	translate([(es+j+m8h+j)*3+dix, 0,0]) rotate([0,0,45]) {
		lx1 = 5;
		ly1 = 12;
		ly2 = 40;
		lx2 = 20 + 1.5;
		hull(){
			translate([lx1, ly1, -1]) cylinder(r=1.6, h=ep*2);
			translate([lx1, ly2, -1]) cylinder(r=1.6, h=ep*2);
		}
		translate([lx2, 25, -1]) cylinder(r=1.6, h=ep*2);
		translate([lx2, 43, -1]) cylinder(r=1.6, h=ep*2);
	}
	
	// surface
	translate([(es+j+m8h+j)*3+dix+5, -1,-1])  cube([lcx, lcy, ep+2]);
}

module surlame(){
	
}
	

axe();
//translate([0,0,ep*2]) mirror([0,0,1]) axe(0.5);
lame();
translate([0,0,ep+1]) surlame();



