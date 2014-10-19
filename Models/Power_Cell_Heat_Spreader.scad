// Units in INCHES

OR = 25.4*1/2;				//Outside Diameter
OL = 25.4*4;				//Overall Length
IR = 25.4*1/4;				//Large Inner Diameter
TR = 25.4*5/32;			//Throat Diameter
IL = 25.4*2.8;				//Internal Length
TL = 25.4*0.25;			//Throat Length
TrR= 25.4*3/8;				//Thread Outer Diameter
TrL= 25.4*0.5;				//Thread Length

difference() {
	union() {
		cylinder(r=OR, h=OL-TrL, $fn=100);
		translate([0,0,OL-TrL]) cylinder(r=TrR, h=TrL, $fn=100);
	}
	translate([0,-OR,-0.1]) cube(size = [OR*2,OR*2,OL+.2]);
	translate([0,0,-0.1]) cylinder(r=TR, h=TL+.2, $fn=100);
	translate([0,0,TL-0.1]) cylinder(r=IR, h=OL, $fn=100);
}