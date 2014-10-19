OD = 25.4*1/2;				//Outer Diameter
ID = 25.4*3/16;			//Hole Diameter
OL = 25.4*3;				//Overall Length
TL = 25.4*.25;				//Throat Length
TD = 25.4*5/16;			//Throat Diameter
LL = 25.4*.2;				//Lip Length

difference() {
	union() {
		cylinder(d=OD, h=OL-TL-LL, $fn=100);
		translate([0,0,OL-TL-LL]) cylinder(d=TD, h=TL, $fn=100);
		translate([0,0,OL-LL]) cylinder(d=OD, h=LL, $fn=100);
	}
	translate([0,0,LL+TL]) cylinder(d=ID, h=OL-TL, $fn=100);
}