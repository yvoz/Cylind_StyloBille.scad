// Seringue Douille.scad
// Tous droits réservés www.mon-fablab.fr - 2017
// Licence GPLv3 - usage NON COMMERCIAL uniquement
// Contributeurs : X. HINAULT, Y. LE GAL

epz = 5;
rdou = 15/2;
ldou = 24 - 8; // - epais plc
epx = 4;
epf = 2;

esp = 35;

rvd = 5/2;

cox = 11;
coy = epx+3.5;
coz = 10;

use<Cubo.scad>;
include <Hexa.scad>;

difference(){
	union(){
		hull(){
			translate([-esp/2, 0, 0]) cylinder(r=rvd+epx, h=epz);
			translate([0, 0, 0]) cylinder(r=rdou+epx*1.5, h=epz);
			translate([+esp/2, 0, 0]) cylinder(r=rvd+epx, h=epz);
		}
		// hauteur
		translate([0, 0, epz]) cylinder(r=rdou+epx, h=ldou);
		
		
		// cube collier
		translate([-cox/2, rdou+0.3, epz+ldou-coz]) cubo([cox,coy,coz], [3,4], 3);
		
	}
	// douille
	translate([0, 0, -1]) cylinder(r=rdou+0.3, h=epz+ldou+2);
	// vis
	translate([-esp/2, 0, -1]) cylinder(r=rvd+0.2, h=epz+2, $fn=16);
	translate([esp/2, 0, -1]) cylinder(r=rvd+0.2, h=epz+2, $fn=16);
	// fente
	translate([-epf/2, 0, -1]) cube([epf, rdou+epx+10, ldou+epz+2]);
	
	// vis serrage
	translate([-cox, rdou+epx, epz+ldou-4]) rotate([0,90,0]) cylinder(r=1.5+0.2, h=20, $fn=3*4);
	translate([cox/2 , rdou+epx, epz+ldou-4]) rotate([0,90,0]) rotate([0,0,30]) cylinder(r=m3r+0.4, h=20, $fn=6);
	translate([-cox/2 , rdou+epx, epz+ldou-4]) rotate([0,-90,0]) rotate([0,0,30]) cylinder(r=m3r+0.4, h=20, $fn=6);
	
}
