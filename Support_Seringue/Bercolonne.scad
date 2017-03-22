// Seringue Bercolonne.scad
// Tous droits réservés www.mon-fablab.fr - 2017
// Licence GPLv3 - usage NON COMMERCIAL uniquement
// Contributeurs : X. HINAULT, Y. LE GAL

nivz = 30;

rbag = 4; // rayon colonne
epx = 4; // epais entre vis et bord
epy = 16; // epais bord a bord
rvs = 5/2; // rayon vis serrage & fixa

ycolo = 100;

include <Hexa.scad>;

module bercolonne() difference(){
	cube([epx+rvs*2+epx+rbag*2+epx+rvs*2+epx, epy, nivz]);
	translate([epx+rvs*2+epx+rbag, -1, nivz]) rotate([-90,0,0]) cylinder(r=rbag, h=epy+2); // corps seringue
	
	
	// vis serrage 
	translate([epx+rvs, epy/2, -1]) {
		cylinder(r=rvs+0.2, h=nivz+2);
		//translate([0,0,15]) cylinder(r=m5r+0.5, h=m5h+0.4, $fn=6);
		//translate([-m5r,0,15]) cylinder(r=m5r+0.5, h=m5h+0.4, $fn=6);
	}
	translate([epx+rvs*2+epx+rbag*2+epx+rvs, epy/2, -1]) {
		cylinder(r=rvs+0.2, h=nivz+2);
		//translate([0,0,15]) cylinder(r=m5r+0.5, h=m5h+0.4, $fn=6);
		//translate([+m5r,0,15]) cylinder(r=m5r+0.5, h=m5h+0.4, $fn=6);
	}
	
	
	/*
	// vis fixa
	translate([(epx+rvs*2+epx+rbag)- spx/2, epy/2, -1]){ 
		#cylinder(r=rvs+0.2, h=nivz+2);
		//translate([0,0,1+10]) cylinder(r=m5r+0.5, h=nivz+2);
	}
	translate([(epx+rvs*2+epx+rbag)+ spx/2, epy/2, -1]){ 
		cylinder(r=rvs+0.2, h=nivz+2);
		//translate([0,0,1+10]) cylinder(r=m5r+0.5, h=nivz+2);
	}
	*/
}

module bercolcouv() translate([0,0,nivz]) difference(){
	cube([epx+rvs*2+epx+rbag*2+epx+rvs*2+epx, epy, rbag+epx]);
	// tranche de jeux
	translate([-1,-1,0]) cube([epx+rvs*2+epx+rbag*2+epx+rvs*2+epx+2, epy+2, 0.7]);
	// corps seringue
	translate([epx+rvs*2+epx+rbag, -1, 0]) rotate([-90,0,0]) cylinder(r=rbag, h=epy+2);
	// vis serrage 
	translate([epx+rvs, epy/2, -1]) cylinder(r=rvs+0.2, h=nivz+2);
	translate([epx+rvs*2+epx+rbag*2+epx+rvs, epy/2, -1]) cylinder(r=rvs+0.2, h=nivz+2);

}

rotate([90,0,0]){
	bercolonne();
	translate([0, 0, 5]) bercolcouv();
}
//translate([0, ycolo-epy, 0]) {
//	berceau();
//	couv();
//}

// print 
//translate([0,-10,nivz+rbag+epx]) rotate([180,0,0]) bercolcouv();


