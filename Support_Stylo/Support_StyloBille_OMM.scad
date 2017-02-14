
$fn = 12;

//ep = 8; // epaisseur OMMP
ep = 15; // epaisseur OMM

ez = 10; // epaisseur z
ex = 8;
epr = 5; // ep-3; // epaisseur cylindre

rsty = 6; // rayon stylo
rres = 3.55; // rayon resort

sps = 60; // espace vis support
spc = 37; // espace colonnes
//dco = 22; // distance support / colonnes OMMP
dco = 27; // distance support / colonnes OMMP

rv = 2.5 +0.1; // rayon vis
rc = 3; // rayon colonnes

rr = 6; // rayon roulement bille 
rrz = 19; // roulement long

include <Hexa.scad>;

module sercol(ro){
    difference(){
        union(){
            translate([0,0,0]) cylinder(r=ro+epr, h=ez, $fn=4*5);
            // plot serrage
            translate([-epr,0,0]) cube([epr*2,ro+epr+2,ez]);
        }
        translate([0,0,-1]) cylinder(r=ro, h=ez+2, $fn=4*5);
        // fente
        translate([-1,0,-1]) cube([2,ro+epr+rc+1,ez+2]);
        // vis serrages
        translate([-epr-epr/2, ro+epr-1.6, ez/2]) rotate([0,90,0]) cylinder(r=1.6, h=epr*3+2);
        translate([epr, ro+epr-1.6, ez/2]) rotate([0,90,0]) rotate([0,0,30]) cylinder(r=m3r+0.4, h=epr, $fn=6);
        translate([-epr*2, ro+epr-1.6, ez/2]) rotate([0,90,0]) rotate([0,0,30]) cylinder(r=m3r+0.4, h=epr, $fn=6);
    }
}

module colonnes(){
	dx = 15; // distance entre vis et centre vide écrou
	dy = 5; // profondeur vide écrou
	ddx = 10; // largeur vide écrou
	
    difference(){
        cube([ex+sps+ex, ep, ez]);
        translate([ex, -1, ez/2]) rotate([-90,0,0]) cylinder(r=rv, h=ep+2);
        translate([ex+sps, -1, ez/2]) rotate([-90,0,0]) cylinder(r=rv, h=ep+2);
		// cubes vide ecrou
		translate([ex+dx-ddx/2, -1, -1]) cube([ddx, dy+1, ez+2]);
		translate([ex+sps-dx-ddx/2, -1, -1]) cube([ddx, dy+1, ez+2]);
		
    }
    translate([ex+sps/2-spc/2-ep/2, ep,0]) cube([ep,dco-ep-rr-1,ez]);
	difference(){
		translate([ex+sps/2-spc/2, dco,0]) sercol(rr+0.2);
		translate([ex-1.7, ep+1, ez/2]) rotate([-90,0,0]) cylinder(r=rv+1, h=rr*4);
	}
    translate([ex+sps/2+spc/2-ep/2, ep, 0]) cube([ep,dco-ep-rr-1,ez]);
	difference(){
		translate([ex+sps/2+spc/2, dco,0]) sercol(rr+0.2);
		translate([ex+sps+1.7, ep+1,ez/2]) rotate([-90,0,0]) cylinder(r=rv+1, h=rr*4);
	}
}
 
module stylo(){
	jspa = 0.0;
	//
    translate([ex+sps/2-spc/2-jspa, dco,0]) rotate([0,0,90]) sercol(rc+0.1);
    translate([ex+sps/2+spc/2+jspa, dco,0]) rotate([0,0,-90]) sercol(rc+0.1);
    //
    difference(){
        union(){
            translate([ex+sps/2-spc/2+rc, dco-ex/2,0]) cube([spc-rc*2,ex ,ez]);
            translate([ex+sps/2-spc/2+spc/2, dco,0]) cylinder(r=rsty+epr, h=ez, $fn=4*5);
        }
        translate([ex+sps/2-spc/2+spc/2, dco,-1]) cylinder(r=rsty, h=ez+2, $fn=4*5);
        // vis serrages
        translate([ex+sps/2-spc/2+spc/2, dco,ez/2]) rotate([-90,0,45]) cylinder(r=1.5, h=rsty+epr+1);
        translate([ex+sps/2-spc/2+spc/2, dco,ez/2]) rotate([-90,0,-45]) cylinder(r=1.5, h=rsty+epr+1);
    }
}

module plaquevis(){
	sps_z = 40;
	//bor = 4;
	//
	difference(){
		cube([ex+sps+ex, ez/2+rv+sps_z+rv+ez/2, 4]);
		
		translate([ex, ex, -1]) cylinder(r=rv, h=4+2);
		translate([ex+sps, ex, -1]) cylinder(r=rv, h=4+2);
		translate([ex+sps, ex+sps_z, -1]) cylinder(r=rv, h=4+2);
		translate([ex, ex+sps_z, -1]) cylinder(r=rv, h=4+2);
		
	}
}

//translate([0,0,ez]) stylo();				// Mobile
//translate([0,30,0]) stylo();
//plaquevis(); 
translate([0,0,0]) colonnes();			// Fixe
translate([0,45,0]) colonnes();
