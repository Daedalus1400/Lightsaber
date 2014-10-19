// Units in INCHES

OD = 25.4*1;				//Outside Diameter
OL = 25.4*4;				//Overall Length
ID = 25.4*1/2;				//Large Inner Diameter
TD = 25.4*5/16;			//Throat Diameter
IL = 25.4*2.8;				//Internal Length
TL = 25.4*0.25;			//Throat Length
TrD= 25.4*3/4;				//Thread Outer Diameter
TrL= 25.4*0.5;				//Thread Length

difference() {
	union() {
		cylinder(d=OD, h=OL-TrL, $fn=100);
		translate([0,0,OL-TrL]) cylinder(d=TrD, h=TrL, $fn=100);
	}
	translate([0,-OD/2,-0.1]) cube(size = [OD,OD,OL+.2]);
	translate([0,0,-0.1]) cylinder(d=TD, h=TL+.2, $fn=100);
	translate([0,0,TL-0.1]) cylinder(d=ID, h=OL, $fn=100);
}