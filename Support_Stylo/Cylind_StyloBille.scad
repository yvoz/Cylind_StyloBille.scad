
// Cylind_StyloBille.scad
// Tous droits réservés www.mon-fablab.fr - 2017
// Licence GPLv3 - usage NON COMMERCIAL uniquement
// Contributeurs : X. HINAULT, Y. LE GAL

rsty = 6; // rayon stylo
rbig = 43/2;  // rayon cylindre de serrage 

rv = 2.5 + 0.1; // rayon vis
rc = 3; // rayon colonnes
rr = 6; // rayon roulement bille 
rrz = 19; // roulement long


supx = 80;
supz = 20;

epr = 4;
eprr = 3; // épaisseur roulement
epz = 3;

include <Hexa.scad>;
//use<Hexa.scad>;


module roulinf(){
	difference(){
		union(){
			cylinder(r=rbig+epr, h=supz+epz);
		}
		// tube exterieur
		tub();
		// centre interieur
		translate([0,0,-1]) cylinder(r=rbig-epr, h=supz+epz+2);
		//
		for(g=[0:3]){
			rotate([0,0,120*g]) translate([0,rbig-rr-1, 0])  
			translate([0,0,-1])  cylinder(r=rr+0.1, h=supz+1);
		}
		for(g=[0:3]){
			rotate([0,0,120*g]) translate([0,rbig-rr-1, 0]) difference(){
				translate([0,0,-1]) cylinder(r=rc+2, h=supz+epz+2);
			}
		}
	}
	
	difference(){
		union(){
			for(g=[0:3]){
				rotate([0,0,120*g]) translate([0,rbig-rr-1, 0]) difference(){
					cylinder(r=rr+eprr, h=supz+epz);
					translate([0,0,-1])  cylinder(r=rr+0.1, h=supz+epz+2);
					translate([-0.5,-rr-eprr-1,-1])  cube([1, eprr+2, supz+epz+2]);
				}
			}
		}
		tub();
	}
	
	// vis jointures
	for(g=[0:3]){
		rotate([0,0,120*g+60]) translate([0,rbig-epr-m3r-0.4, 0]) difference(){
			translate([0,0,supz]) cylinder(r=epr*1.6, h=epz);
			translate([0,0,supz-1]) cylinder(r=1.9, h=epz+2, $fn=12);
		}
	}
}

module roulsup(){
		// vis jointures
	for(g=[0:3]){
		rotate([0,0,120*g+60]) translate([0,rbig-epr-m3r-0.4, 0]) difference(){
			translate([0,0,supz]) cylinder(r=epr*1.6, h=epz);
			translate([0,0,supz-1]) cylinder(r=1.8, h=epz+2, $fn=12);
		}
	}
	
	for(g=[0:3]){
		rotate([0,0,120*g]) translate([0,rbig-rr-1, 0]) difference(){
			cylinder(r=rr+eprr, h=supz+epz);
			translate([0,0,-1])  cylinder(r=rr+0.1, h=supz+epz+2);
			translate([-0.5,-rr-eprr-1,-1])  #cube([1, eprr+2, supz+epz+2]);
			if(g==0) translate([0,-rr-eprr,0])  #sphere(r=2); 
		}
	}
	
	translate([0,0,supz]) difference(){
		cylinder(r=rbig+epr, h=epz);
		translate([0,0,-1]) cylinder(r=rbig-1.5, h=supz+epz+2);
	}
	
}



module tub(){
	j = 0.1;
	difference(){
		translate([0,0,-1]) cylinder(r=rbig+epr+1, h=supz+1);
		translate([0,0,-1]) cylinder(r=rbig+j, h=supz+2);
	}
}



module colo(qt=2){ // qt-1 de colonnes serrées
	epcolz = 10;
	eprcol = 3.7;
	j = 0.1; // léger jeux resserrage colonnes;
	// tenues colonnes
	//qt = 0;
	for(g=[0:qt]){
		rotate([0,0,120*g]) translate([0,rbig-rr-1-j, 0]) difference(){
			union(){
				translate([0,0,0]) cylinder(r=rc+eprcol, h=epcolz);
				// plot
				rotate([0,0,-7])
					translate([rc,-eprcol,0]) cube([eprcol+2, eprcol*2, epcolz]);
			}
			rotate([0,0,-7]){
				translate([0,0,-70]) #cylinder(r=rc+0.2, h=epcolz+2+70);
				// fente
				translate([2, -1.5/2, -1]) cube([eprcol*2, 1.5, epcolz+2]);
				// vis serrages
				translate([rc+2.5, eprcol*2, epcolz/2]) rotate([90,0,0]) cylinder(r=1.6, h=eprcol*4, $fn=9);
				translate([rc+2.5, eprcol, epcolz/2]) rotate([-90,0,0]) cylinder(r=m3r+0.4, h=m3h+0.6, $fn=6);
				translate([rc+2.5, -eprcol, epcolz/2]) rotate([90,0,0]) cylinder(r=m3r+0.4, h=m3h+0.6, $fn=6);
			}
				
		}
	}
	if(qt < 2){ // colonnes libres restantes
		for(g=[qt+1:2]){
			rotate([0,0,120*g]) translate([0,rc+eprcol+rsty, 0]) difference(){
				hull(){
					translate([0,0,0])  cylinder(r=rc+eprcol, h=epcolz);
					translate([0,3,0])  cylinder(r=rc+eprcol, h=epcolz);
					// plot
					//rotate([0,0,-7])
					//	translate([rc,-eprcol,0]) cube([eprcol+2, eprcol*2, epcolz]);
				}
				hull(){
					translate([0,0,-1])  cylinder(r=rc+0.3, h=epcolz+2);
					translate([0,3,-1])  cylinder(r=rc+0.3, h=epcolz+2);
				}
				/*
				rotate([0,0,-7]){
				
					// fente
					translate([2, -1, -1]) cube([eprcol*2, 2, epcolz+2]);
					// vis serrages
					translate([rc+2.5, eprcol*2, epcolz/2]) rotate([90,0,0]) cylinder(r=1.6, h=eprcol*4, $fn=9);
					translate([rc+2.5, eprcol, epcolz/2]) rotate([-90,0,0]) cylinder(r=m3r+0.4, h=m3h+0.6, $fn=6);
					translate([rc+2.5, -eprcol, epcolz/2]) rotate([90,0,0]) cylinder(r=m3r+0.4, h=m3h+0.6, $fn=6);
				}
				*/	
			}
		}
	}
	// centre tenue stylo
	difference(){
		cylinder(r=rsty+eprcol, h=epcolz);
		translate([0,0,-1]) cylinder(r=rsty, h=epcolz+2);
		//
		for(g=[0:qt]){
			rotate([0,0,120*g]) translate([0,rbig-rr-1, 0]){
				rotate([0,0,-7]){
					translate([rc+2.5, eprcol*2, epcolz/2]) rotate([90,0,0]) cylinder(r=1.6, h=eprcol*4+2, $fn=9);
					//translate([rc+2.5, eprcol, epcolz/2]) rotate([-90,0,0]) cylinder(r=3.5, h=eprcol);
					translate([rc+2.5, -eprcol, epcolz/2]) rotate([90,0,0]) cylinder(r=m3r+0.4, h=m3h+0.6, $fn=6);
					translate([rc+2.5+2.5, -eprcol, epcolz/2]) rotate([90,0,0]) cylinder(r=m3r+0.4, h=m3h+0.6, $fn=6);
				}
			}
		}
		for(g=[0:3]){
			rotate([0,0,120*g -10]) translate([0,0,epcolz/2]) rotate([90,0,0]) cylinder(r=1.5, h=rsty+eprcol+1, $fn=9);
		}
	}
}



//translate([0,0,60]) colo();

translate([0,0,30]) roulsup();

//roulinf();

