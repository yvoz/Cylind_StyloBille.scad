
// include <Hexa.scad>;

m3h = 2.4;
m3k = 5.5;
m3r = m3k/2;

m4h = 3.2;
m4k = 7;
m4r = m4k/2;

m5h = 4.7;
m5k = 8;
m5r = m5k/2;

m6h = 5.2;
m6k = 10;
m6r = m6k/2;

m8h = 6.8;
m8k = 13;
m8r = m8k/2;

coef = 2/sqrt(3);
echo(coef);

module m3(jk=0, jh=0, jvis=0){
    d = m3k * coef;
    cylinder(r=d/2+jk, h=m3h+jh, $fn=6);
    if(jvis != 0){
        translate([0,0,-30]) cylinder(r=3/2+jvis, h=60, $fn=12);
    }
}
