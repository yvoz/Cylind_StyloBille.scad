

ep = 2;
rvd = 5/2;

epx = 4;
esp = 35;

esp1= 37.5;
esp2 = 39;

difference(){
	hull(){
		translate([-esp1, 0, 0]) cylinder(r=17, h=ep);
		
		translate([-esp/2, 0, 0]) cylinder(r=rvd+epx, h=ep);
		translate([0, 0, 0]) cylinder(r=rdou+epx*1.5, h=ep);
		translate([+esp/2, 0, 0]) cylinder(r=rvd+epx, h=ep);
		
		translate([esp2, 0, 0]) cylinder(r=20, h=ep);
	}
	
	// trous
	translate([0,0,-1]){
		translate([-esp1, 0, 0]) cylinder(r=5, h=ep+2);
		
		translate([-esp/2, 0, 0]) cylinder(r=rvd+0.3, h=ep+2);
		translate([0, 0, 0]) cylinder(r=15/2+0.4, h=ep+2);
		translate([esp/2, 0, 0]) cylinder(r=rvd+0.3, h=ep+2);
		
		translate([esp2-9, 0, 0]) cylinder(r=1.8, h=ep+2);
		translate([esp2+9, 0, 0]) cylinder(r=1.8, h=ep+2);
		
	}
	
}


