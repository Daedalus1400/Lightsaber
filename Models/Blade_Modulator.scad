OR = 1/2 * 25.4;
IR = 3/32 * 25.4;
OR2 = 5/32 * 25.4;
ThreadedOR = 5/32 * 25.4;
Fin_Thickness = 0.1 * 25.4;
FinnedHeight = 4 * 25.4;
ThreadedHeight = 1/2 * 25.4;
ModulatorOR = 3/32 * 25.4;
Modulator_Offset = 5/16 * 25.4;
Fins = floor(FinnedHeight/(Fin_Thickness*2));

$fn = 50;

difference() 
{
	union()
	{
		for(i = [0 : Fins-1]) 
		{
			translate([0,0,i*2*Fin_Thickness]) cylinder(r=OR, h=Fin_Thickness);
			translate([0,0,(i*2+1)*Fin_Thickness]) cylinder(r=OR2, h=Fin_Thickness);
		}
	translate([0,0,FinnedHeight-Fin_Thickness]) cylinder(r=ThreadedOR, h=ThreadedHeight);
	}
	translate([0,0,-.5]) cylinder(r=IR, h=FinnedHeight+ThreadedHeight+Fin_Thickness+1);
	for(i = [1 : 3])
	{
		rotate([0,0,120*i]) translate([Modulator_Offset,0,-.5]) cylinder(r=ModulatorOR, h=FinnedHeight+10);
	}
}