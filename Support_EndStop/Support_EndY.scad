
$fn = 12;

pro = 20; // largeur du profil alu
lend = 17; // largeur base plot
proy = 15;

lz = 16; // 15-4; // decalage z // 16-4

ep = 3; // epaisseur

esptr = 11; // espace trous end stop

use<Cubo.scad>;
    
    difference(){
        union(){
            cubo([pro*2,proy+ep+3+ep+proy,ep], [9,10,11,12], 4);
            translate([0,proy,0]) cube([lend,ep+3+ep,lz]);
        }
        
        translate([lend/2-esptr/2,proy+ep+1.5,-1]) {
			cylinder(r=1.5, h=lz+2);
			translate([0,0,lz-1]) cylinder(r1=1.5, r2=2, h=3);
		}
        translate([lend/2+esptr/2,proy+ep+1.5,-1]) {
			cylinder(r=1.5, h=lz+2);
			translate([0,0,lz-1]) cylinder(r1=1.5, r2=2, h=3);
		}
        
        hull(){
            translate([7,proy/2,-1]) cylinder(r=2.6, h=ep+2);
            translate([pro*2-7,proy/2,-1]) cylinder(r=2.6, h=ep+2);
        }
        hull(){
            translate([7,proy+ep+3+ep+proy/2,-1]) cylinder(r=2.6, h=ep+2);
            translate([pro*2-7,proy+ep+3+ep+proy/2,-1]) cylinder(r=2.6, h=ep+2);
        }
    }
        
    

/*
    translate([0,pro,lz]) difference(){
        cube([pro,pro/3*2,ep]);
        hull(){
            translate([pro/2+esptr/2,ep*2.3,-1]) cylinder(r=1.6, h=ep+2);
            translate([pro/2+esptr/2,pro*0.55,-1]) cylinder(r=1.6, h=ep+2);
        }
        hull(){
            translate([pro/2-esptr/2,ep*2.3,-1]) cylinder(r=1.6, h=ep+2);
            translate([pro/2-esptr/2,pro*0.55,-1]) cylinder(r=1.6, h=ep+2);
        }
    }
    */

