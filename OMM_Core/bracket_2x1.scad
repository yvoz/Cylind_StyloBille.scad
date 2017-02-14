
module 90BracketMin(){

// 90 degree bracket
// modifié par X. HINAULT - www.mon-club-elec.fr

$fn = 25;
length = 20;
width = 20;
walls = 3;

rHole = 2.6;

rotate([90, 0, 0])
difference()
{
    cube([length, length, width], center=true);
    
    translate([4, 4, 0])
    cube([length, length, width-(walls * 2)], center=true);
    
    rotate([0,0,45])
    translate([length/2 + 3, 0, 0])
    cube([length, length + 20, width+2], center= true);

    translate([0, -1, 0]) rotate([90, 0, 0]) #cylinder(r=rHole, h=10);

    //translate([-length/2 - 5, -length/2 + 16, 0])
    //rotate([0, 90, 0])
    //#cylinder(r=rHole, h=10);
	
	translate([-length/2 - 5, -length/2 + 15, 0]) rotate([0, 90, 0]) cylinder(r=rHole, h=10);
	
}

} // fin module 

lx = 20;
ly = 20;
lz = lx;
j = 0.2;
ep = 4;

rHole = 2.6;

use<Cubo.scad>;

translate([0,0,0]) translate([lx/2, ly/2, lx/2]) 90BracketMin();
translate([0,20,0]) translate([lx/2, ly/2, lx/2]) 90BracketMin();
difference(){
	translate([0,-lx,0]) cube([lx,lx,ep]);
	 translate([lx/2, -ly/2, -1]) rotate([0,0, 0]) cylinder(r=rHole, h=10);
}
translate([0,-ep,0]) cubo([ep,ep,lz], [12], ep);
translate([-ly,0,0]) rotate([0,0,-90]) translate([lx/2, ly/2, lx/2]) 90BracketMin();


