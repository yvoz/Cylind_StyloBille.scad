// Seringue Berceau2.scad
// Tous droits réservés www.mon-fablab.fr - 2017
// Licence GPLv3 - usage NON COMMERCIAL uniquement
// Contributeurs : X. HINAULT, Y. LE GAL

nivz = 20 + 27; // orig 30;

nivzc = 20; // orig 30

rbag = 27/2+1+0.5; // rayon des bagues base et tete
epx = 4; // epais entre vis et bord
epy = 16; // epais bord a bord en y
rvs = 5/2; // rayon vis serrage & fixa
spx = 20; // espace trous fixation  

rcol = 4;

function ber_bov() = epx+rvs;  // bord a centre vis
function ber_spv() = rvs+epx+rbag*2+epx+rvs; // espace vis a vis
function ber_y() = epy;


include <Hexa.scad>;

module berceau() difference(){
	cube([epx+rvs*2+epx+rbag*2+epx+rvs*2+epx, epy, nivz]);
	translate([epx+rvs*2+epx+rbag, -1, nivz]) rotate([-90,0,0]) cylinder(r=rbag, h=epy+2); // corps seringue
	
	// vis serrage seringue
	translate([epx+rvs, epy/2, -1]) {
		cylinder(r=rvs+0.2, h=nivz+2);
		translate([0,0,nivz-15]) cylinder(r=m5r+0.5, h=m5h+0.4, $fn=6);
		translate([-m5r,0,nivz-15]) cylinder(r=m5r+0.5, h=m5h+0.4, $fn=6);
	}
	translate([epx+rvs*2+epx+rbag*2+epx+rvs, epy/2, -1]) {
		cylinder(r=rvs+0.2, h=nivz+2);
		translate([0,0,nivz-15]) cylinder(r=m5r+0.5, h=m5h+0.4, $fn=6);
		translate([+m5r,0,nivz-15]) cylinder(r=m5r+0.5, h=m5h+0.4, $fn=6);
	}
	
	// vis fixa
	translate([(epx+rvs*2+epx+rbag)- spx/2, epy/2, -1]){ 
		cylinder(r=rvs+0.2, h=nivz+2);
		translate([0,0,1+10]) cylinder(r=m5r+0.5, h=nivz+2);
	}
	translate([(epx+rvs*2+epx+rbag)+ spx/2, epy/2, -1]){ 
		cylinder(r=rvs+0.2, h=nivz+2);
		translate([0,0,1+10]) cylinder(r=m5r+0.5, h=nivz+2);
	}
	
	// colonne 
	translate([epx+rvs*2+epx+rbag, -1, nivzc]) rotate([-90,0,0]) cylinder(r=rcol+0.1, h=epy+2);
	
}

module couv() translate([0,0,nivz]) difference(){
	cube([epx+rvs*2+epx+rbag*2+epx+rvs*2+epx, epy, rbag+epx]);
	// tranche de jeux
	translate([-1,-1,0]) cube([epx+rvs*2+epx+rbag*2+epx+rvs*2+epx+2, epy+2, 0.5]);
	// corps seringue
	translate([epx+rvs*2+epx+rbag, -1, 0]) rotate([-90,0,0]) cylinder(r=rbag, h=epy+2);
	// vis serrage 
	translate([epx+rvs, epy/2, -1]) cylinder(r=rvs+0.2, h=nivz+2);
	translate([epx+rvs*2+epx+rbag*2+epx+rvs, epy/2, -1]) cylinder(r=rvs+0.2, h=nivz+2);

}




rotate([90,0,0]){  
	berceau();
	translate([0,0,7]) couv();
}


// print
//translate([]) rotate([180,0,0]) couv();





