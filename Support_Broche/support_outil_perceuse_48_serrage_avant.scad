

// par X. HINAULT
// avril 2015 - Juillet 2016

$fn=50;

// variable du chariot
beam=20;
bearing=13;
correct=0.1;


// longtout=24+bearing*2; // longueur totale sens "largeur"

largtout=60; // écartement des trous, calculé

difference() {

	union() {
		translate([-5/2,0,0])cube([15,largtout+12,10], center=true); 
		translate([-30,0,0])cylinder(h=10, r=31, $fn=50, center=true); 

		translate([-60,0,0])cube([22,15,10], center=true);

	}

	// trous fixation chariot
	//rotate([0,90,0])translate([0,longtout/2-bearing/2+1,0])#cylinder(h=20, r=2.5, $fn=50, center=true);
	//rotate([0,90,0])translate([0,-(longtout/2-bearing/2+1),0])#cylinder(h=20, r=2.5, $fn=50, center=true);

	rotate([0,90,0])translate([0,largtout/2,0])#cylinder(h=20, r=2.5, $fn=50, center=true);
	rotate([0,90,0])translate([0,-(largtout/2),0])#cylinder(h=20, r=2.5, $fn=50, center=true);

	// empreinte vis chariot
	//#rotate([0,90,0])translate([0,0,6/2])cube([12,25,6],center=true);

	//translate([6/2,beam/2+bearing/2-correct,0])rotate([0,90,0])cube([12,10,6],center=true);
	//translate([6/2,-(beam/2+bearing/2-correct),0])rotate([0,90,0])cube([12,10,6],center=true);

	//translate([6/2,beam/2+bearing/2-correct,0])rotate([0,90,0])cylinder(h=20, r=2.35, $fn=50, center=true);
	//translate([6/2,-(beam/2+bearing/2-correct),0])rotate([0,90,0])cylinder(h=20, r=2.35, $fn=50, center=true);

	// support outil
	#translate([-30,0,0])cylinder(h=20, r=24, $fn=50, center=true); 

	//translate([-20,0,0])rotate([0,90,0])#cylinder(h=20, r=1.5, $fn=50, center=true);

	#translate([-55,0,0])cube([40,5,12], center=true);

	#translate([-65,0,0])rotate([90,0,0])cylinder(h=20, r=2.5, $fn=50, center=true); // axe serrage
}