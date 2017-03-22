

epp = 6; // epaiseur plaque

rvs = 5/2; // rayon vis fixa

use <RouleVis.scad>;
use <Berceau.scad>;
use <Bercolonne.scad>;

// berceau
// ber_bov() bord a centre vis
// ber_spv() espace entre vis et vis
// ber_y() = largeur en y;

// roul
// roul_bov() bord a centre vis
// roul_spv() espace entre vis et vis
// roul_y() = largeur en y;


projection() union(){

	translate([5, 10+17,0]) roulevis();
	translate([5+51, 5+155+15 ,0]) rotate([0,0,90]) import("support_moteur_y.stl");

	translate([5+47, 5, 0]) bercolonne();
	translate([5+47, 5+203+15, 0]) bercolonne();

	translate([5+75, 5+156+15, 0]) berceau();
	translate([5+75, 5+156+65+15, 0]) berceau();
	
}




