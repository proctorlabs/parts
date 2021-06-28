include <lib/all.scad>;

/* [Batteries] */
Battery_Lanes = 4;
Battery_Rows = 12;
Battery_Spacing = 2;

/* [Bus Bar] */
Bus_Bar_Diameter = 7.5;

/* [Other] */
Plate_Thickness = 9;
Scale_Factor = 1.05;

// END USER OPTIONS
/* [Hidden] */
$fs = 0.32;

Battery_Insert_Depth = Plate_Thickness - 1.5;
Bus_Bar_Radius = Bus_Bar_Diameter / 2;
Plate_Boundary = Plate_Thickness - Bus_Bar_Radius;

// Battery spacing, size, etc..
Battery_Diameter = 18650_DIAMETER + 18650_DIAMETER_TOLERANCE;
Battery_Contact_Diameter = Battery_Diameter * 0.6;
Battery_Boundary = Plate_Thickness - Battery_Insert_Depth;

// Individual cell size
Cell_Size = Battery_Diameter + Battery_Spacing;
Bus_Bars = Battery_Lanes - 1; // >1 lanes will fit 1 bar between each pair

// Base plate dimensions
Plate_Length = (Battery_Rows * Cell_Size) + (Plate_Boundary * 2);
Plate_Width = (Battery_Lanes * Cell_Size) + (Plate_Boundary * 2) + (Bus_Bars * Bus_Bar_Diameter);

module Plate() {
    difference() {
        cuboid([
            Plate_Width,
            Plate_Length,
            Plate_Thickness
        ], fillet=Plate_Thickness / 2, edges=EDGES_BOTTOM);

        yspread(Cell_Size, Battery_Rows)
        xspread(Cell_Size + Bus_Bar_Diameter, Battery_Lanes)
        {
            up((Plate_Thickness - Battery_Insert_Depth) / 2 + 0.01)
            zcyl(l=Battery_Insert_Depth, d=Battery_Diameter);
            zcyl(l=Plate_Thickness * 2, d=Battery_Contact_Diameter);
        }
    }
}

module BusBars() {
    down(Plate_Thickness / 2)
    xspread(Cell_Size + Bus_Bar_Diameter, Bus_Bars) {
        ycyl(l=Plate_Length + Cell_Size, d=Bus_Bar_Diameter);
        // down(Bus_Bar_Radius) cuboid([Bus_Bar_Diameter, Plate_Length + Cell_Size, Bus_Bar_Diameter]);
    }
}

scale([Scale_Factor, Scale_Factor, Scale_Factor]) {
    difference() {
        color("Silver")
        Plate();
        BusBars();
    }

    color("DarkOrange", 0.2)
    %BusBars();
}
