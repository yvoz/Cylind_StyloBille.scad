// Seringue BrasCoul.scad
// Tous droits réservés www.mon-fablab.fr - 2017
// Licence GPLv3 - usage NON COMMERCIAL uniquement
// Contributeurs : X. HINAULT, Y. LE GAL

ep = 2;
rvd = 5/2;

epx = 4;
vdou = 35; // douille billes : vis fixa <-> vis fixa

//esp1() colonne <-> vis moteur
//esp2 vis moteur <-> tete seringue
//esp3 tete seringue <-> colonne

<<<<<<< HEAD
$fn= 4*12;

use <Plaque.scad>;
=======
$fn= 32;
>>>>>>> 9f00b0d9bc6af254a5b2ab3feab6f8d3f2584565

projection() 
difference(){
	hull(){
		translate([-esp1(), 0, 0]) cylinder(r=26, h=ep);
		
		//translate([-esp/2, 0, 0]) cylinder(r=rvd+epx, h=ep);
		//translate([0, 0, 0]) cylinder(r=15/2+epx*1.5, h=ep);
		//translate([+esp/2, 0, 0]) cylinder(r=rvd+epx, h=ep);
		
<<<<<<< HEAD
		translate([esp2()+esp3(), 0, 0]) cylinder(r=26, h=ep);
=======
		translate([esp2, 0, 0]) cylinder(r=22, h=ep);
>>>>>>> 9f00b0d9bc6af254a5b2ab3feab6f8d3f2584565
	}
	
	// trous
	translate([0,0,-1]){
<<<<<<< HEAD
		
		// colonne
		translate([-esp1(),0,0]){
			hull(){
				translate([-vdou/2-1, 0, 0]) cylinder(r=rvd+0.3, h=ep+2);
				translate([-vdou/2+1, 0, 0]) cylinder(r=rvd+0.3, h=ep+2);
			}
			hull(){
				translate([-1, 0, 0]) #cylinder(r=15/2+0.4, h=ep+2);
				translate([+1, 0, 0]) #cylinder(r=15/2+0.4, h=ep+2);
			}
			hull(){
				translate([vdou/2-1, 0, 0]) cylinder(r=rvd+0.3, h=ep+2);
				translate([vdou/2+1, 0, 0]) cylinder(r=rvd+0.3, h=ep+2);
			}
		}
		
		// vis moteur
		translate([0, 0, 0]) cylinder(r=5, h=ep+2);
		translate([0, 0, 0])  for(g=[0:2]){
			rotate([0,0,g*360/3]) translate([10,0,0])  cylinder(r=1.7, h=ep+2);
		}
		
		// Tete seringue
		translate([esp2()-9, 0, 0]) cylinder(r=1.8, h=ep+2);
		translate([esp2()+9, 0, 0]) cylinder(r=1.8, h=ep+2);
=======
		
		translate([-esp1, 0, 0]) cylinder(r=5, h=ep+2);
		translate([-esp1, 0, 0])  for(g=[0:2]){
			rotate([0,0,g*360/3]) translate([10,0,0])  cylinder(r=1.7, h=ep+2);
		}
		
		hull(){
			translate([-esp/2-1, 0, 0]) cylinder(r=rvd+0.3, h=ep+2);
			translate([-esp/2+1, 0, 0]) cylinder(r=rvd+0.3, h=ep+2);
		}
		hull(){
			translate([-1, 0, 0]) cylinder(r=15/2+0.4, h=ep+2);
			translate([+1, 0, 0]) cylinder(r=15/2+0.4, h=ep+2);
		}
		hull(){
			translate([esp/2-1, 0, 0]) cylinder(r=rvd+0.3, h=ep+2);
			translate([esp/2+1, 0, 0]) cylinder(r=rvd+0.3, h=ep+2);
		}
>>>>>>> 9f00b0d9bc6af254a5b2ab3feab6f8d3f2584565
		
		// colonne 2
		translate([esp2()+esp3(),0,0]){
			hull(){
				translate([-vdou/2-1, 0, 0]) cylinder(r=rvd+0.3, h=ep+2);
				translate([-vdou/2+1, 0, 0]) cylinder(r=rvd+0.3, h=ep+2);
			}
			hull(){
				translate([-1, 0, 0]) #cylinder(r=15/2+0.4, h=ep+2);
				translate([+1, 0, 0]) #cylinder(r=15/2+0.4, h=ep+2);
			}
			hull(){
				translate([vdou/2-1, 0, 0]) cylinder(r=rvd+0.3, h=ep+2);
				translate([vdou/2+1, 0, 0]) cylinder(r=rvd+0.3, h=ep+2);
			}
		}
		
	}
	
}


