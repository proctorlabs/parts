include <lib/all.scad>;
/* [General] */
Export_Case = true;

Export_Lid = true;

/* [PCB Dimensions] */
// Length of the PCB (exclude the USB port)
PCB_Length = 85;
// Width of the PCB
PCB_Width = 56;
// PCB global margin on all sides
PCB_Margin = 4.5;

PCB_Margin_Left = 0;
PCB_Margin_Right = 0;
PCB_Margin_Front = 20;
PCB_Margin_Back = 0;

// Diameter of the screw holes
Screw_Diameter = 2.35;
// Does not affect output, but hides the PCB from the preview
Preview_PCB = true;

/* [Tray Dimensions] */
// Thickness of the base tray
Tray_Thickness = 3;

Do_Tray_Cutout = false;
Tray_Cutout_X = 121;
Tray_Cutout_Y = 55.1;
Tray_Cutout_X_Size = 6.5;
Tray_Cutout_Y_Size = 41;

/* [Case Dimensions] */
Case_Height = 32;
Vents_Enabled = true;
Vent_Margins_Length_Factor = 0.85;
Vent_Margins_Width_Factor = 0.6;

/* [Standoff Positions] */
// How high the standoffs should be from the tray
Standoff_Height = 5;
// Standoff 1 enabled
Standoff1 = true;
// Standoff 1 XY coordinates
Standoff1XY = [3.5, 3.5];
// Standoff 2 enabled
Standoff2 = true;
// Standoff 2 XY coordinates
Standoff2XY = [-3.5, 3.5];
// Standoff 3 enabled
Standoff3 = true;
// Standoff 3 XY coordinates
Standoff3XY = [3.5, 61.5];
// Standoff 4 enabled
Standoff4 = true;
// Standoff 4 XY coordinates
Standoff4XY = [-3.5, 61.5];
// Standoff 5 enabled
Standoff5 = false;
// Standoff 5 XY coordinates
Standoff5XY = [0, 0];
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
//detail
$fs = 0.32;

//Standoff Matrix
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

Left_Cutouts = [
    [1, [65, 0, 4]]
];
Right_Cutouts = [];
Front_Cutouts = [
    [0, [17, 0, 20, 15.5]]
];
Back_Cutouts = [
    [0, [7, 0, 18, 12]]
];

//Colors
Outer_Color = "SteelBlue";
Standoff_Color = "LightSteelBlue";
PCB_Color = "Green";
Text_Color = "White";

//Calculated
Width = PCB_Width + (PCB_Margin * 2);
Total_Width = Width + PCB_Margin_Left + PCB_Margin_Right;
Length = PCB_Length + (PCB_Margin * 2);
Total_Length = Length + PCB_Margin_Front + PCB_Margin_Back;
Thickness = Tray_Thickness;


module PCB() {
    if (Preview_PCB) {
        %up(Standoff_Height + Thickness) {
            color(PCB_Color, 0.2) {
                cuboid([PCB_Width, PCB_Length, 1], fillet=2, edges=EDGES_Z_ALL);
            }

            up(2) {
                color(Text_Color, 0.4) {
                    linear_extrude(height=1) {
                        text("PCB", font="Times", halign="center", valign="center");
                    }
                }
            }
        }
    }
}

module Tray() {
    color(Outer_Color) {
        difference() {
            difference() {
                cuboid([Width, Length, Thickness], fillet=Thickness / 2, edges=EDGES_X_ALL + EDGES_Y_ALL);
                for (i = Standoffs) {
                    if (i[0] == true) {
                        right(i[1][0] - (PCB_Width / 2))
                        forward(i[1][1] - (PCB_Length / 2))
                        cyl(h=Thickness + 0.2, d=Screw_Diameter);
                    }
                }
            }

            if (Do_Tray_Cutout == true) {
                right(Tray_Cutout_X - (PCB_Width / 2))
                fwd(Tray_Cutout_Y - (PCB_Length / 2))
                down(Thickness)
                cube([Tray_Cutout_X_Size, Tray_Cutout_Y_Size, Thickness * 2]);
            }
        }
    }
}

module Case() {
    left_offset = (PCB_Margin_Left / 2) - (PCB_Margin_Right / 2);
    front_offset = (PCB_Margin_Front / 2) - (PCB_Margin_Back / 2);

    color(Outer_Color) {
        difference() {
            left(left_offset) fwd(front_offset) cuboid([Total_Width, Total_Length, Thickness]);
            Vents();
        }

        up((Case_Height/2) - (Thickness / 2)) {
            fwd(front_offset) {
                left((Width/2) + PCB_Margin_Left)
                difference() {
                    cuboid([Thickness, Total_Length + Thickness, Case_Height], fillet=(Thickness/2), edges=EDGES_Z_ALL + EDGES_BOTTOM);
                    zrot(90) Cutouts(Left_Cutouts, Width);
                }
                right((Width/2) + PCB_Margin_Right)
                difference() {
                    cuboid([Thickness, Total_Length + Thickness, Case_Height], fillet=(Thickness/2), edges=EDGES_Z_ALL + EDGES_BOTTOM);
                    zrot(90) Cutouts(Right_Cutouts, Width);
                }
            }

            left(left_offset) {
                fwd((Length/2) + PCB_Margin_Front)
                difference() {
                    cuboid([Total_Width + Thickness, Thickness, Case_Height], fillet=(Thickness/2), edges=EDGES_Z_ALL + EDGES_BOTTOM);
                    Cutouts(Front_Cutouts, Width);
                }
                back((Length/2) + PCB_Margin_Back)
                difference() {
                    cuboid([Total_Width + Thickness, Thickness, Case_Height], fillet=(Thickness/2), edges=EDGES_Z_ALL + EDGES_BOTTOM);
                    Cutouts(Back_Cutouts, Width);
                }
            }
        }
    }
}

module Standoffs() {
    up(Thickness/2) {
        color(Standoff_Color) {
            for ( i = Standoffs ) {
                if (i[0] == true) {
                    m_right = i[1][0] < 0 ? PCB_Width + i[1][0] : i[1][0];
                    m_fwd = i[1][1] < 0 ? PCB_Length + i[1][1] : i[1][1];
                    right(m_right - (PCB_Width / 2))
                    forward(m_fwd - (PCB_Length / 2))
                    tube(h=Standoff_Height, id=Screw_Diameter, od2=Screw_Diameter * 2, od1=Screw_Diameter * 3);
                }
            }
        }
    }
}

module Vents() {
    if (Vents_Enabled) {
        right(PCB_Margin_Right/2)
        left(PCB_Margin_Left/2)
        fwd(PCB_Margin_Front/2)
        back(PCB_Margin_Back/2)
        yspread(Thickness * 2, l=(Total_Length * Vent_Margins_Length_Factor))
        xscale((Total_Width * Vent_Margins_Width_Factor) / Thickness)
        zcyl(h=Thickness + 0.1, r=Thickness / 2);
    }
}

module Cutouts(c_matrix, width) {
    left((width/2) - Thickness) down((Case_Height/2) - Thickness - Standoff_Height) {
        for (cutout = c_matrix) {
            type = cutout[0];
            opts = cutout[1];
            c_X = opts[0];
            c_Y = opts[1];
            if (type == 0) { //Square
                c_width = opts[2];
                c_height = opts[3];
                right(c_X + (c_width / 2) + Thickness) up(c_Y + (c_height / 2) + (Thickness / 2))
                cuboid([c_width, Thickness + 0.1, c_height], fillet=Thickness / 2, edges=EDGES_Y_ALL);
            }
            if (type == 1) { //Circle
                c_radius = opts[2];
                right(c_X + c_radius) up(c_Y + c_radius)
                ycyl(h=Thickness + 0.1, r=c_radius);
            }
            echo(cutout);
        }
    }
}

module Lid() {
    left_offset = (PCB_Margin_Left / 2) - (PCB_Margin_Right / 2);
    front_offset = (PCB_Margin_Front / 2) - (PCB_Margin_Back / 2);
    clip_height = Case_Height * 0.28;
    side_clip_size = Total_Length / 6;
    face_clip_size = Total_Width / 6;

    up(Case_Height * 1.5) color(Outer_Color) {
        difference() {
            left(left_offset) fwd(front_offset)
                cuboid([Total_Width + Thickness, Total_Length + Thickness, Thickness], fillet=Thickness / 2, edges=EDGES_TOP + EDGES_Z_ALL);
            Vents();
        }

        down((clip_height/2) - (Thickness / 2)) {
            fwd(front_offset) {
                left((Width/2) + PCB_Margin_Left - Thickness) fwd(Total_Length / 4)
                    cuboid([Thickness, side_clip_size, clip_height]);
                left((Width/2) + PCB_Margin_Left - Thickness) back(Total_Length / 4)
                    cuboid([Thickness, side_clip_size, clip_height]);
                right((Width/2) + PCB_Margin_Right - Thickness) fwd(Total_Length / 4)
                    cuboid([Thickness, side_clip_size, clip_height]);
                right((Width/2) + PCB_Margin_Right - Thickness) back(Total_Length / 4)
                    cuboid([Thickness, side_clip_size, clip_height]);
            }
        

            left(left_offset) {
                fwd((Length/2) + PCB_Margin_Front - Thickness) left(Total_Width / 4)
                    cuboid([face_clip_size, Thickness, clip_height]);
                fwd((Length/2) + PCB_Margin_Front - Thickness) right(Total_Width / 4)
                    cuboid([face_clip_size, Thickness, clip_height]);
                back((Length/2) + PCB_Margin_Back - Thickness) left(Total_Width / 4)
                    cuboid([face_clip_size, Thickness, clip_height]);
                back((Length/2) + PCB_Margin_Back - Thickness) right(Total_Width / 4)
                    cuboid([face_clip_size, Thickness, clip_height]);
            }
        }
    }
}

if (Export_Case) {
    Case();
    Standoffs();
    PCB();
}

if (Export_Lid) {
    Lid();
}