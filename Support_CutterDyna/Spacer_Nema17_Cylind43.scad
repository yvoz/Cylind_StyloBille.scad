

spaz = 55; // distance surface Base / Nema

rbas = 44/2; // rayon espace de broche
rnem = 29/2; // rayon espace du coupleur 24/2 mini

rb = 3;
rn = 1.5;
rtv = 4; // rayon tourne vis

bax = 20; // distance entre trous base X
bay = 60; // distance entre trous base Y

nemx = 31; // distance entre trous nema17

epx = 8; // epaisseur X et Y
epz = 14; // epaisseur Z

j = 0.2;
k = 1;


difference(){
	union(){
		cube([epx+bax+epx, epx+bay+epx, epz]);
		translate([epx+bax/2, epx+bay/2, 0]) cylinder(r=rbas+epx, h=spaz);
	}
	
	// truncate
	translate([-bax, 0, epz]) cube([bax*4, epx*2, spaz]);
	translate([-bax, epx+bay+epx-epx*2, epz]) cube([bax*4, epx*2, spaz]);
	//translate([epx+bax/2, 0, epz*2]) {
	//}
	
	translate([epx+bax/2, epx+bay/2, -1]) {
		cylinder(r=rbas, h=epz/2+1);
		cylinder(r=rnem, h=spaz+2);
	}
	
	// percage nema
	translate([epx+bax/2, epx+bay/2, 0]) {
		translate([-nemx/2, -nemx/2, -1]) {
			cylinder(r=rn+j, h=spaz+2, $fn = 12);
			cylinder(r=rtv, h=spaz-epz, $fn = 12);
		}
		translate([-nemx/2, +nemx/2, -1]) {
			cylinder(r=rn+j, h=spaz+2, $fn = 12);
			cylinder(r=rtv, h=spaz-epz, $fn = 12);
		}
		translate([+nemx/2, +nemx/2, -1]) {
			cylinder(r=rn+j, h=spaz+2, $fn = 12);
			cylinder(r=rtv, h=spaz-epz, $fn = 12);
		}
		translate([+nemx/2, -nemx/2, -1]) {
			cylinder(r=rn+j, h=spaz+2, $fn = 12);
			cylinder(r=rtv, h=spaz-epz, $fn = 12);
		}
	}
	
	
}


