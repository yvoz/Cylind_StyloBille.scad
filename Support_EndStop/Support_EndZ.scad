
// Support_EndZ.scad
// Tous droits réservés www.mon-fablab.fr - 2017
// Licence GPLv3 - usage NON COMMERCIAL uniquement
// Contributeurs : X. HINAULT, Y. LE GAL

$fn = 12;

pro = 20; // largeur du profil alu

lx = 20-2; // decalage x
ly = 2; // decalage y
lay = 20; // long oblong


ep = 3; // epaisseur

esptr = 10.5; // espace trous end stop

difference(){ 
    //cube([ep,pro+lay/2-ly,pro]);
    cube([ep,pro+ep,pro]);
    translate([-1,pro/2-0.2,pro/2]) rotate([0,90,0]) cylinder(r=2.6, h=ep+2);
}

translate([lay/2-ly+ep,pro+lay/2-ly,0]) #cube([lx-(lay/2-ly),ep,pro]);
translate([lay/2-ly+ep,pro,0]) cube([lx-(lay/2-ly),lay/2-ly+ep,1]);


translate([0,pro,0]) {
    difference(){
        intersection(){
            cube([lay/2-ly+ep,lay/2-ly+ep,pro]);
            translate([lay/2-ly+ep,0,0]) cylinder(r=lay/2-ly+ep, h=pro, $fn=32);
        }
        translate([lay/2-ly+ep,0,1]) cylinder(r=lay/2-ly, h=pro, $fn=32);
    }
}

difference(){ 
    translate([-pro,pro,0]) cube([pro,ep,pro]);
    translate([-pro/2,pro-1,pro/2]) rotate([-90,0,0]) cylinder(r=2.6, h=ep+2);
}


translate([lx,pro-lay/2-ly,0]) difference(){ 
    cube([ep,lay,pro]);
    hull(){
        translate([-1,5,pro/2+esptr/2]) rotate([0,90,0]) cylinder(r=1.6, h=ep+2);
        translate([-1,lay-5,pro/2+esptr/2]) rotate([0,90,0]) cylinder(r=1.6, h=ep+2);
    }
    hull(){
        translate([-1,5,pro/2-esptr/2]) rotate([0,90,0]) cylinder(r=1.6, h=ep+2);
        translate([-1,lay-5,pro/2-esptr/2]) rotate([0,90,0]) cylinder(r=1.6, h=ep+2);
    }
    // tournevis
    hull(){
        translate([-1,lay/2+ly-pro/2,pro/2]) rotate([0,90,0]) cylinder(r=2, h=ep+2);
        translate([-1,0,pro/2]) rotate([0,90,0]) cylinder(r=2, h=ep+2);
    }
    
}