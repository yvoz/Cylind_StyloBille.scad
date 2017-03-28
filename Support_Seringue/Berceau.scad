// Seringue Berceau.scad
// Tous droits réservés www.mon-fablab.fr - 2017
// Licence GPLv3 - usage NON COMMERCIAL uniquement
// Contributeurs : X. HINAULT, Y. LE GAL

nivz = 30;

rbag = 27/2+1+0.5; // rayon des bagues base et tete
epx = 4; // epais entre vis et bord
epy = 16; // epais bord a bord
rvs = 5/2; // rayon vis serrage & fixa
spx = 20; // espace trous fixation  

include <Hexa.scad>;

module berceau() difference(){
	cube([epx+rvs*2+epx+rbag*2+epx+rvs*2+epx, epy, nivz]);
	translate([epx+rvs*2+epx+rbag, -1, nivz]) rotate([-90,0,0]) cylinder(r=rbag, h=epy+2); // corps seringue
	
	// vis serrage 
	translate([epx+rvs, epy/2, -1]) {
		cylinder(r=rvs+0.3, h=nivz+2);
		translate([0,0,15]) cylinder(r=m5r+0.35, h=m5h+0.2, $fn=6);
		translate([-m5r,0,15]) cylinder(r=m5r+0.35, h=m5h+0.2, $fn=6);
	}
	translate([epx+rvs*2+epx+rbag*2+epx+rvs, epy/2, -1]) {
		cylinder(r=rvs+0.3, h=nivz+2);
		translate([0,0,15]) cylinder(r=m5r+0.35, h=m5h+0.2, $fn=6);
		translate([+m5r,0,15]) cylinder(r=m5r+0.35, h=m5h+0.2, $fn=6);
	}
	
	// vis fixa
	translate([(epx+rvs*2+epx+rbag)- spx/2, epy/2, -1]){ 
		cylinder(r=rvs+0.3, h=nivz+2);
		translate([0,0,1+10]) cylinder(r=m5r+0.3, h=nivz+2);
	}
	translate([(epx+rvs*2+epx+rbag)+ spx/2, epy/2, -1]){ 
		cylinder(r=rvs+0.3, h=nivz+2);
		translate([0,0,1+10]) cylinder(r=m5r+0.3, h=nivz+2);
	}
	
}

module couv() translate([0,0,nivz]) difference(){
	cube([epx+rvs*2+epx+rbag*2+epx+rvs*2+epx, epy, rbag+epx]);
	// tranche de jeux
	translate([-1,-1,0]) cube([epx+rvs*2+epx+rbag*2+epx+rvs*2+epx+2, epy+2, 1]);
	// corps seringue
	translate([epx+rvs*2+epx+rbag, -1, 0]) rotate([-90,0,0]) cylinder(r=rbag, h=epy+2);
	// vis serrage 
	translate([epx+rvs, epy/2, -1]) cylinder(r=rvs+0.3, h=nivz+2);
	translate([epx+rvs*2+epx+rbag*2+epx+rvs, epy/2, -1]) cylinder(r=rvs+0.3, h=nivz+2);

}

rotate([-90,0,0]) {
	berceau();
	translate([0,0,10]) couv();
}
// print
//translate([]) rotate([180,0,0]) couv();





