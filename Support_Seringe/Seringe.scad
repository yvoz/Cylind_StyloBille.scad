
// Corps
log = 87;
rco = 27/2;

// Base
bax = 32/2;
bay = 39/2;
ep = 2.8;


module corps() difference(){
	
	union(){
		// corps
		log = 87;
		rco = 27/2;
		cylinder(r=rco, h=log); 
		cylinder(r=rco+1, h=11.5); 
		translate([0,0,log-10]) cylinder(r=rco+1, h=10); 
		translate([0,0,log]) cylinder(r=11/2, h=12); 

		// base
		hull(){
			translate([-7,-bay,0]) cube([14,3,ep]);
			translate([-7,bay-3,0]) cube([14,3,ep]);
			cylinder(r=bax, h=ep); 
		}
	}
	
	// vide
	translate([0,0,-1]) cylinder(r=rco-2, h=log);
	translate([0,0,log-2]) cylinder(r=11/2-2, h=20);
}

// pist
rpou = 32/2;
rpis = rco-3;
lpis = 100;

module pist(){
	
	cylinder(r=rpou, h=ep);
	cylinder(r=12/2, h=15);
	difference(){
		translate([0,0,10]) cylinder(r=rpis, h=lpis-10);
		translate([0,0,12]) cylinder(r=rpis-2, h=lpis-14);
	}
	
}

difference() {
	rotate([0,90,0]) pist();
	translate([-50,-50,-50]) cube([200,120,50]);
}

translate([0,40,0]) difference() {
	rotate([0,90,0]) corps();
	translate([-50,-50,-50]) cube([200,120,50]);
}

/*
translate([0,40*2,0]) difference() {
	rotate([0,90,0]) pist();
	translate([-50,-50,-50]) cube([200,120,50]);
}

translate([0,40*3,0]) difference() {
	rotate([0,90,0]) corps();
	translate([-50,-50,-50]) cube([200,120,50]);
}
*/