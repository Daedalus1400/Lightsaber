OR = 25.4*1/4;				//Outer Diameter
IR = 25.4*3/32;			//Hole Diameter
OL = 25.4*3;				//Overall Length
TL = 25.4*.25;				//Throat Length
TR = 25.4*5/32;			//Throat Diameter
LL = 25.4*.2;				//Lip Length

difference() {
	union() {
		cylinder(r=OR, h=OL-TL-LL, $fn=100);
		translate([0,0,OL-TL-LL]) cylinder(r=TR, h=TL, $fn=100);
		translate([0,0,OL-LL]) cylinder(r=OR, h=LL, $fn=100);
	}
	translate([0,0,LL+TL]) cylinder(r=IR, h=OL-TL, $fn=100);
}