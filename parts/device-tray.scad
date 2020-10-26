include <lib/all.scad>;

/* [PCB Dimensions] */
// Length of the PCB (exclude the USB port)
PCB_Length = 99.9;
// Width of the PCB
PCB_Width = 130.44;

/* [Tray Dimensions] */
// Thickness of the base tray
Tray_Thickness = 3.5;
// PCB Threshold
PCB_Threshold = 2;
// How high the standoffs should be from the tray
Standoff_Height = 5;
// Diameter of the screw holes
Screw_Diameter = 2.35;

Do_Tray_Cutout = true;
Tray_Cutout_X = 121;
Tray_Cutout_Y = 55.1;
Tray_Cutout_X_Size = 6.5;
Tray_Cutout_Y_Size = 41;

/* [Standoff Positions] */
// Standoff 1 enabled
Standoff1 = true;
// Standoff 1 XY coordinates
Standoff1XY = [4.22, 4.22];
// Standoff 2 enabled
Standoff2 = true;
// Standoff 2 XY coordinates
Standoff2XY = [126.22, 4.22];
// Standoff 3 enabled
Standoff3 = true;
// Standoff 3 XY coordinates
Standoff3XY = [126.22, 95.95];
// Standoff 4 enabled
Standoff4 = true;
// Standoff 4 XY coordinates
Standoff4XY = [4.22, 95.95];
// Standoff 5 enabled
Standoff5 = true;
// Standoff 5 XY coordinates
Standoff5XY = [64.67, 95.95];
// Standoff 6 enabled
Standoff6 = false;
// Standoff 6 XY coordinates
Standoff6XY = [0,0];
// Standoff 7 enabled
Standoff7 = false;
// Standoff 7 XY coordinates
Standoff7XY = [0,0];
// Standoff 8 enabled
Standoff8 = false;
// Standoff 8 XY coordinates
Standoff8XY = [0,0];

/* [Hidden] */
$fs = 0.32;
Standoffs = [
    [Standoff1, Standoff1XY],
    [Standoff2, Standoff2XY],
    [Standoff3, Standoff3XY],
    [Standoff4, Standoff4XY],
    [Standoff5, Standoff5XY],
    [Standoff6, Standoff6XY],
    [Standoff7, Standoff7XY],
    [Standoff8, Standoff8XY]
];


difference() {
    difference() {
        cuboid([PCB_Width + (PCB_Threshold * 2), PCB_Length + (Tray_Thickness / 2) + (PCB_Threshold * 2), Tray_Thickness], fillet=Tray_Thickness / 2, edges=EDGES_X_ALL + EDGES_Y_ALL);
        for ( i = Standoffs ) {
            if (i[0] == true) {
                right(i[1][0] - (PCB_Width / 2))
                forward(i[1][1] - (PCB_Length / 2))
                cyl(h=Tray_Thickness + 0.2, d=Screw_Diameter);
            }
        }
    }
    if (Do_Tray_Cutout == true) {
        right(Tray_Cutout_X - (PCB_Width / 2))
        fwd(Tray_Cutout_Y - (PCB_Length / 2))
        down(Tray_Thickness)
        cube([Tray_Cutout_X_Size, Tray_Cutout_Y_Size, Tray_Thickness * 2]);
    }
}

for ( i = Standoffs ) {
    if (i[0] == true) {
        up(Tray_Thickness/2)
        right(i[1][0] - (PCB_Width / 2))
        forward(i[1][1] - (PCB_Length / 2))
        tube(h=Standoff_Height, id=Screw_Diameter, od2=Screw_Diameter * 2, od1=Screw_Diameter * 3);
    }
}
