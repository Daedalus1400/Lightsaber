OL = 25.4*4;
rad1 = 25.4*0.75;
rad2 = 25.4*0.625;
rad3 = 25.4*.5;
height = rad1-rad2;
n = 100;

difference()
{
	for ( i = [0 : height*4 : OL - height*4])
	{
		translate([0,0,i]) cylinder(r =rad2, h = height, $fn = n);
		translate([0,0,i+height]) cylinder(r1 = rad2, r2 = rad1, h = height, $fn = n);
		translate([0,0,i+2*height]) cylinder(r = rad1, h = height, $fn = n);
		translate([0,0,i+3*height]) cylinder(r1 = rad1, r2 = rad2, h = height, $fn = n);
	};
	translate([0,0,-0.1]) cylinder(r = rad3, h = OL + 0.2, $fn = n);
}