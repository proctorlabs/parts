include <lib/all.scad>;

/* [Joint] */
Joint_Length = 18;
Joint_Height = 34;
Joint_Thickness = 3;
Edge_Thickness = 10;

Joint_Type = "sheet_edge";

/* [Screw] */
Screw_Diameter = 4;

/* [Plexiglass] */
Plexiglass_Thickness = 3;

// END USER OPTIONS
/* [Hidden] */
$fs = 0.32;
E = 0.01;
Joint_Offset = (Joint_Length/2) - Joint_Thickness - (Plexiglass_Thickness / 2);

module GlassConnector(
    length=undef,
    height=undef,
    joint_thickness=undef,
    glass_thickness=undef,
    include_screw=true,
    fill_bottom=false,
    screw_diameter=undef,
    round_edges=EDGES_NONE
) {
    thickness = (joint_thickness * 2) + glass_thickness;
    up_value = fill_bottom ? Edge_Thickness : 0;
    difference() {
        cuboid([
            length,
            thickness,
            height,
        ], fillet=thickness / 2, edges=round_edges);

        up(up_value)
        left(Edge_Thickness)
        cuboid([
            length + E,
            glass_thickness,
            height + E,
        ]);

        if(include_screw) {
            // up(up_value / 2)
            right((length / 2) - (Edge_Thickness / 2))
            ycyl(l=thickness + E, d=screw_diameter);
            if(fill_bottom) {
                down((height / 2) - (Edge_Thickness / 2))
                left(Edge_Thickness / 2)
                ycyl(l=thickness + E, d=screw_diameter);
            }
        }
    }
}

if(Joint_Type == "two_way_corner") {
    GlassConnector(
        length=Joint_Length,
        height=Joint_Height,
        joint_thickness=Joint_Thickness,
        glass_thickness=Plexiglass_Thickness,
        include_screw=true,
        screw_diameter=Screw_Diameter,
        round_edges=EDGE_BK_RT
    );

    forward(Joint_Offset)
    right(Joint_Offset)
    zrot(90)
    GlassConnector(
        length=Joint_Length,
        height=Joint_Height,
        joint_thickness=Joint_Thickness,
        glass_thickness=Plexiglass_Thickness,
        include_screw=true,
        screw_diameter=Screw_Diameter,
        round_edges=EDGE_FR_RT
    );
}

if(Joint_Type == "connector") {
    GlassConnector(
        length=Joint_Length,
        height=Joint_Height,
        joint_thickness=Joint_Thickness,
        glass_thickness=Plexiglass_Thickness,
        include_screw=true,
        screw_diameter=Screw_Diameter
    );

    right(Joint_Offset * 2)
    zrot(180)
    GlassConnector(
        length=Joint_Length,
        height=Joint_Height,
        joint_thickness=Joint_Thickness,
        glass_thickness=Plexiglass_Thickness,
        include_screw=true,
        screw_diameter=Screw_Diameter
    );
}

if(Joint_Type == "sheet_corner") {
    GlassConnector(
        length=Joint_Length,
        height=Joint_Height,
        joint_thickness=Joint_Thickness,
        glass_thickness=Plexiglass_Thickness,
        include_screw=true,
        fill_bottom=true,
        screw_diameter=Screw_Diameter,
        round_edges=EDGE_BOT_RT
    );
}

if(Joint_Type == "sheet_edge") {
    GlassConnector(
        length=Joint_Length,
        height=Joint_Height,
        joint_thickness=Joint_Thickness,
        glass_thickness=Plexiglass_Thickness,
        include_screw=true,
        fill_bottom=false,
        screw_diameter=Screw_Diameter
    );
}
