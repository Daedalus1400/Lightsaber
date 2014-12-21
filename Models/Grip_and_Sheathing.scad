TargetLength = 25.4*12;
GripOR = 25.4*0.625;
GripGrooveOR = 25.4*0.5625;
GripIR = 25.4*8/16;
Clearance = 0.01;
SheathIR = GripOR + Clearance;
SheathOR = SheathIR + 25.4*1/16;
CutoutHeight = 25.4*(1+6/16);
CutoutLength = 25.4*3.5;
CutoutOffset = 25.4*0.25;
CutoutAngle = 60;
n = 50;
UnitHeight = GripOR-GripGrooveOR;
OverallLength = TargetLength; //floor(TargetLength/(UnitHeight*4))*UnitHeight*4;
echo("Target Height: ", TargetLength, " mm");
echo("Actual Height: ", OverallLength, " mm");
echo("Unit Height: ", UnitHeight*4, " mm");

grip();
sheath();

module grip() {
	difference()
	{
		for ( i = [0 : UnitHeight*4 : OverallLength - UnitHeight*2])
		{
			translate([0,0,i]) cylinder(r =GripGrooveOR, h = UnitHeight, $fn = n);
			translate([0,0,i+UnitHeight]) cylinder(r1 = GripGrooveOR, r2 = GripOR, h = UnitHeight, $fn = n);
			translate([0,0,i+2*UnitHeight]) cylinder(r = GripOR, h = UnitHeight, $fn = n);
			translate([0,0,i+3*UnitHeight]) cylinder(r1 = GripOR, r2 = GripGrooveOR, h = UnitHeight, $fn = n);
		}
		translate([0,0,-0.1]) cylinder(r = GripIR, h = OverallLength + 0.2, $fn = n);
	}
}

module sheath() {
	size = 25.4*3;
	difference()
	{
		cylinder(r = SheathOR, h = OverallLength, $fn = n);
		translate([0,0,-.1]) cylinder(r = SheathIR, h = OverallLength + 0.2, $fn = n);
		mirror([1,0,0]) 
		{
			translate([CutoutOffset,-(SheathOR+.1),CutoutHeight]) cube([2*(SheathOR+.1),2*(SheathOR+.1),CutoutLength]);
			translate([CutoutOffset,-(SheathOR+.1),CutoutHeight]) rotate([0,CutoutAngle,0]) cube(size);
			translate([CutoutOffset,-(SheathOR+.1),CutoutHeight+CutoutLength]) rotate([0,90-CutoutAngle,0]) cube(size);
			translate([CutoutOffset,-(SheathOR+.1),OverallLength-CutoutHeight-CutoutLength]) cube([2*(SheathOR+.1),2*(SheathOR+.1),CutoutLength]);
			translate([CutoutOffset,-(SheathOR+.1),OverallLength-CutoutHeight-CutoutLength]) rotate([0,CutoutAngle,0]) cube(size);
			translate([CutoutOffset,-(SheathOR+.1),OverallLength-CutoutHeight]) rotate([0,90-CutoutAngle,0]) cube(size);
		}
		translate([CutoutOffset,-(SheathOR+.1),CutoutHeight]) cube([2*(SheathOR+.1),2*(SheathOR+.1),CutoutLength]);
		translate([CutoutOffset,-(SheathOR+.1),CutoutHeight]) rotate([0,CutoutAngle,0]) cube(size);
		translate([CutoutOffset,-(SheathOR+.1),CutoutHeight+CutoutLength]) rotate([0,90-CutoutAngle,0]) cube(size);
		translate([CutoutOffset,-(SheathOR+.1),OverallLength-CutoutHeight-CutoutLength]) cube([2*(SheathOR+.1),2*(SheathOR+.1),CutoutLength]);
		translate([CutoutOffset,-(SheathOR+.1),OverallLength-CutoutHeight-CutoutLength]) rotate([0,CutoutAngle,0]) cube(size);
		translate([CutoutOffset,-(SheathOR+.1),OverallLength-CutoutHeight]) rotate([0,90-CutoutAngle,0]) cube(size);
	}
}