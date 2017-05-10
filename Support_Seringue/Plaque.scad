// Seringue Plaque.scad
// Tous droits réservés www.mon-fablab.fr - 2017
// Licence GPLv3 - usage NON COMMERCIAL uniquement
// Contributeurs : X. HINAULT, Y. LE GAL

$fn = 12*4;

epp = 6; // epaiseur plaque

rvs = 5/2; // rayon vis fixa

use <RouleVis.scad>;
use <Berceau.scad>;
use <Bercolonne.scad>;

module visfixa() difference(){
	union(){
		cylinder(r=rvs+5, h=1);
		translate([0,20,0]) cylinder(r=rvs+5, h=1);
		translate([0,-20,0]) cylinder(r=rvs+5, h=1);
	}
	cylinder(r=rvs+0.3, h=1);
	translate([0,20,0]) cylinder(r=rvs+0.3, h=1);
	translate([0,-20,0]) cylinder(r=rvs+0.3, h=1);
	

}


projection() union(){

	translate([5, 5, 0]) bercolonne();
	translate([5, 5+203+15, 0]) bercolonne();

	translate([5+37, 10+17,0]) roulevis();
	translate([5+37+51, 5+155+15 ,0]) rotate([0,0,90]) import("support_moteur_y.stl");

	translate([5+92, 5+155+15, 0]) berceau();
	translate([5+92, 5+155+65+15, 0]) berceau();
	
	translate([5+141, 5, 0]) bercolonne();
	translate([5+141, 5+203+15, 0]) bercolonne();
	
	translate([5+37, 5+155+15-20-30, 0]) visfixa();
	translate([5+141, 5+155+15-20-30, 0]) visfixa();
	
}

// ======== calcul des espaces entres les axes =============

echo(largeur_1()); // largeur support colonne
echo(largeur_2()); // largeur support roulement vis 
echo(largeur_3()); // largeur support seringue

esp1 = 37+largeur_2()/2 - (0+largeur_1()/2);
esp2 = 92+largeur_3()/2 - (37+largeur_2()/2);
esp3 = 141+largeur_1()/2 - (92+largeur_3()/2);

translate([5+largeur_1()/2, 0, 0]) #cube([esp1, 200, 1]);
//translate([5+largeur_1()/2+esp1, 0, 0]) #cube([esp2, 200, 1]);
translate([5+largeur_1()/2+esp1+esp2, 0, 0]) #cube([esp3, 200, 1]);

function esp1() = esp1;
function esp2() = esp2;
function esp3() = esp3;


