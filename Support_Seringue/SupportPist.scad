// Seringue Douille.scad
// Tous droits réservés www.mon-fablab.fr - 2017
// Licence GPLv3 - usage NON COMMERCIAL uniquement
// Contributeurs : X. HINAULT, Y. LE GAL

ep = 3;
spt = 18;

//rpis = 32/2;
//hpis = 2;
// seringue 23mm
//rpis = 29/2;
//hpis = 3;

// seringue 30mm
rpis = 26/2;
hpis = 8;

j = 0.7;



mirror([1,0,0]) difference(){
	
		cylinder(r=rpis+j*4+ep, h=ep+2+j+hpis+j+ep);
		echo(rpis+j*4+ep);
	
		difference(){
			translate([0,0,ep+2]) cylinder(r=rpis+j*4, h=j+hpis+j);
			translate([0,0,ep+2]) cylinder(r=rpis-4+0.3, h=j+hpis+j);
		}
		
		translate([0,0,ep+2])  cylinder(r=rpis-4, h=ep+2+j+hpis+j+ep);
	
		translate([0,30,ep+2+10]) cube([60,60,20], center=true);
		translate([0,30,ep+2+10]) rotate([0,0,-16]) cube([60,60,20], center=true);
		
	
		// vis
		
		translate([spt/2,0,-1]) cylinder(r=1.7, h=10, $fn=12);
		translate([spt/2,0,ep]) cylinder(r=3.5, h=3, $fn=12);
	
		translate([-spt/2,0,-1]) cylinder(r=1.7, h=10, $fn=12);
		translate([-spt/2,0,ep]) cylinder(r=3.5, h=3, $fn=12);
		
		//
        //rvoisin = 4+4; // seringue 23
        rvoisin = 7; // seringue 30
		translate([rpis+j*2+ep+3,0,-1]) cylinder(r=rvoisin, h=20, $fn=32);
	
}