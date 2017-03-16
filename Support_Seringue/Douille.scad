

epz = 5;
rdou = 15/2;
ldou = 24;
epx = 4;
epf = 1;

esp = 35;

rvd = 5/2;

difference(){
	union(){
		hull(){
			translate([-esp/2, 0, 0]) cylinder(r=rvd+epx, h=epz);
			translate([0, 0, 0]) cylinder(r=rdou+epx*1.5, h=epz);
			translate([+esp/2, 0, 0]) cylinder(r=rvd+epx, h=epz);
		}
		// hauteur
		translate([0, 0, epz]) cylinder(r=rdou+epx, h=ldou);
	}
	// douille
	translate([0, 0, -1]) cylinder(r=rdou+0.3, h=epz+ldou+2);
	// vis
	translate([-esp/2, 0, -1]) cylinder(r=rvd+0.2, h=epz+2);
	translate([esp/2, 0, -1]) cylinder(r=rvd+0.2, h=epz+2);
	//
	translate([-epf/2, 0, epz]) cube([epf, rdou+epx+1, ldou+1]);
	
}