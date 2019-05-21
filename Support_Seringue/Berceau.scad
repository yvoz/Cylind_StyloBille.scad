// Seringue Berceau.scad
// Tous droits réservés www.mon-fablab.fr - 2017
// Licence GPLv3 - usage NON COMMERCIAL uniquement
// Contributeurs : X. HINAULT, Y. LE GAL

$fn = 8*4;

nivz = 30;

rbag = 27/2+1+0.5; // rayon des bagues base et tete
epx = 4; // epais entre vis et bord
epy = 16; // epais bord a bord
rvs = 5/2; // rayon vis serrage & fixa
epxt = epx+rvs*2+epx;
spx = 20; // espace trous fixation  

rpiv = 4.4; // axe rotate en alu 
pivz = 14; // hauteur axe rotate en alu 

include <Hexa.scad>;

function largeur_3() = epx+rvs*2+epx+rbag*2+epx+rvs*2+epx;

module berceau() {

	difference(){
		union(){
			cube([epx+rvs*2+epx+rbag*2+epx+rvs*2+epx, epy, nivz]);
			// charnière +
			translate([epxt+rbag*2+epx+rvs,0,nivz]) rotate([-90,0,0]) cylinder(r=epxt/2, h=epy/4);
			translate([epxt+rbag*2+epx+rvs,epy/4*3,nivz]) rotate([-90,0,0]) cylinder(r=epxt/2, h=epy/4);
		}
		// corps seringue
		translate([epx+rvs*2+epx+rbag, -1, nivz]) rotate([-90,0,0]) cylinder(r=rbag, h=epy+2, $fn=8*4); 
		// vis fixa
		translate([(epx+rvs*2+epx+rbag)- spx/2, epy/2, -1]){ 
			cylinder(r=rvs+0.3, h=nivz+2);
			translate([0,0,1+10]) cylinder(r=m5r+0.3, h=nivz+2);
		}
		translate([(epx+rvs*2+epx+rbag)+ spx/2, epy/2, -1]){ 
			cylinder(r=rvs+0.3, h=nivz+2);
			translate([0,0,1+10]) cylinder(r=m5r+0.3, h=nivz+2);
		}
		
		// charnière -
		hull(){
			translate([epxt+rbag*2+epx+rvs,epy/4,nivz]) rotate([-90,0,0]) cylinder(r=epxt/2+0.6, h=epy/2);
			translate([epxt+rbag*2+epxt,epy/4,nivz]) rotate([-90,0,0]) cylinder(r=epxt/2+0.6, h=epy/2);
		}
		translate([epxt+rbag*2+epx+rvs,-1,nivz]) rotate([-90,0,0]) cylinder(r=1.5+0.3, h=epy+2);
		// vis serrage 
		hull(){
			translate([epx+rvs, epy/2, pivz-rpiv-2]) cylinder(r=rvs+0.3, h=nivz+2);
			translate([0, epy/2, pivz-rpiv-2]) cylinder(r=rvs+0.3, h=nivz+2);
		}
		// gond
		hull(){
			translate([epx+rvs, -1, pivz]) rotate([-90,0,0]) #cylinder(r=rpiv+0.4, h=epy+2);
			translate([0, -1, pivz]) rotate([-90,0,0]) cylinder(r=rpiv+0.4, h=epy+2);
		}
		// vis stop gond
		translate([-1, epy/2, 5]) rotate([0,90,0]) cylinder(r=1.5, h=17);
		// découpe stop gond
		#cube([2.2, epy+1, pivz]);
		
	}
	// cache support
	//cube([0.3, epy, nivz]);
}

module couv() translate([0,0,nivz]) {
	// tranche de jeux
	tj = 1;
	
	difference(){
		union(){
			cube([epx+rvs*2+epx+rbag*2+epx+rvs*2+epx, epy, rbag+epx]);
			// charnière +
			translate([epxt+rbag*2+epx+rvs,epy/4+0.5,0]) rotate([-90,0,0]) cylinder(r=epxt/2, h=epy/2-0.5*2);
		}
		// charnière -
		hull(){
			translate([epxt+rbag*2+epx+rvs,0,0]) rotate([-90,0,0]) cylinder(r=epxt/2+0.4, h=epy/4+0.5);
			translate([epxt+rbag*2+epxt,0,0]) rotate([-90,0,0]) cylinder(r=epxt/2+0.4, h=epy/4+0.5);
		}
		hull(){
			translate([epxt+rbag*2+epx+rvs,epy/4*3-0.5,0]) rotate([-90,0,0]) cylinder(r=epxt/2+0.4, h=epy/4+0.5);
			translate([epxt+rbag*2+epxt,epy/4*3-0.5,0]) rotate([-90,0,0]) cylinder(r=epxt/2+0.4, h=epy/4+0.5);
		}
		// axe charnière 
		translate([epxt+rbag*2+epx+rvs,0,0]) rotate([-90,0,0]) cylinder(r=1.5, h=epy);
		
		// tranche de jeux
		translate([-1,-1,0]) cube([epx+rvs*2+epx+rbag*2+epx+rvs*2+epx+2, 1+epy/4+0.5, tj]); //devant
		translate([-1,epy/4*3-0.5,0]) cube([epx+rvs*2+epx+rbag*2+epx+rvs*2+epx+2, 1+epy/4+0.5, tj]); //derriere
		translate([-1,-1,0]) cube([epxt+2, 1+epy+1, tj]); // milieu
		
		// corps seringue
		translate([epx+rvs*2+epx+rbag, -1, 0]) rotate([-90,0,0]) cylinder(r=rbag, h=epy+2, $fn=8*4);
		// vis serrage 
		hull(){
			translate([epx+rvs, epy/2, -1]) cylinder(r=rvs+0.3, h=nivz+2);
			translate([0, epy/2, -1]) cylinder(r=rvs+0.3, h=nivz+2);
		}
		
		// découpe de bascule
		translate([epxt+rbag*2+epx+rvs*2+epx, -1, rvs+2+epx]) rotate([0,-60,0]) cube(30);
		translate([epxt+rbag*2+epx+rvs*2+epx, -1, rvs+2+epx+4.5]) rotate([0,-75,0]) cube(30);
		
	}
	
	// cache support
	//translate([0, 0, tj]) cube([0.3, epy, rbag+epx-tj]);
	
	

}

module stopgond() {
		oe = 2;
	difference(){
		union(){
			translate([-oe, 0, 0.5]) cube([oe,epy,pivz+rpiv-0.5]);
			//translate([0, 0, pivz-(rpiv+0.4)+0.5]) cube([1.5,epy,rpiv*2-0.4]);
		}
		translate([0, 0, pivz-(rpiv+0.4)]);
		translate([-oe-1, epy/2, 5]) rotate([0,90,0]) cylinder(r=1.7, h=oe+3);
		//
		hull(){
			translate([-oe-1, epy/2, pivz]) rotate([0,90,0]) cylinder(r=rvs+0.3, h=oe+3);
			translate([-oe-1, epy/2, pivz+20]) rotate([0,90,0]) cylinder(r=rvs+0.3, h=oe+3);
		}
		
	}
}
	

rotate([90,0,0]){
	//berceau();
	//couv();
	//stopgond();
}

rotate([0,-90,0]) stopgond();





