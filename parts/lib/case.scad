include <BOSL/constants.scad>;
use <BOSL/shapes.scad>;
use <BOSL/transforms.scad>;

E = 0.001;

module Case(
    Case_Color = "SteelBlue",
    Thickness = 2.5,
    Vents = true,
    Vent_Extra_Margin = 10,
    Size = [125, 75, 15],
    Left_Ports = [],
    Right_Ports = [],
    Front_Ports = [],
    Back_Ports = [],
) {
    EDGES = EDGES_Z_ALL; //TODO: Make optional
    Size_X = Size[0] + (Thickness * 2);
    Size_Y = Size[1] + (Thickness * 2);
    Size_Z = Size[2] + (Thickness * 2);
    Vents_Spread_Y = Size_Y > Size_X;

    color(Case_Color)
    difference() {
        up((Size_Z/2))
        cuboid([Size_X, Size_Y, Size_Z], fillet=Thickness, edges=EDGES);
        
        up((Size_Z/2) + Thickness)
        cuboid([Size_X - Thickness, Size_Y - Thickness, Size_Z],
            fillet=Thickness,
            edges=EDGES
        );

        if (Vents && Vents_Spread_Y) {
            up(Thickness / 2)
            yspread(Thickness * 2, l=Size_Y - (Thickness * 4) - Vent_Extra_Margin)
            cuboid(
                [Size_X - (Thickness * 2) - Vent_Extra_Margin, Thickness, Thickness+(2*E)],
                fillet=Thickness/2, edges=EDGES_Z_ALL
            );
        } else if (Vents) {
            up(Thickness / 2)
            xspread(Thickness * 2, l=Size_X - (Thickness * 4) - Vent_Extra_Margin)
            cuboid(
                [Thickness, Size_Y - (Thickness * 2) - Vent_Extra_Margin, Thickness+(2*E)],
                fillet=Thickness/2, edges=EDGES_Z_ALL
            );
        }

        // Cut out all the ports
        for ( port = Left_Ports ) {
            Is_Rect = (len(port) == 4);
            Port_X_Offset = port[0];
            Port_Y_Offset = port[1];
            Port_X_Size = port[2];
            Port_Y_Size = Is_Rect ? port[3] : port[2];
            up((Port_Y_Size / 2) + Port_Y_Offset)
            left((Size_X / 2) - (Thickness/4))
            forward((Size_Y / 2) - (Port_X_Size / 2) - Port_X_Offset)
            if (Is_Rect) {
                cuboid(
                    [Thickness*1.1, Port_X_Size, Port_Y_Size],
                    fillet=Thickness/2, edges=EDGES_X_ALL
                );
            } else if (len(port) == 3) {
                xcyl(h=Thickness * 1.1, d=Port_X_Size);
            }
        }

        for ( port = Right_Ports ) {
            Is_Rect = (len(port) == 4);
            Port_X_Offset = port[0];
            Port_Y_Offset = port[1];
            Port_X_Size = port[2];
            Port_Y_Size = Is_Rect ? port[3] : port[2];
            up((Port_Y_Size / 2) + Port_Y_Offset)
            right((Size_X / 2) - (Thickness/4))
            back((Size_Y / 2) - (Port_X_Size / 2) - Port_X_Offset)
            if (Is_Rect) {
                cuboid(
                    [Thickness*1.1, Port_X_Size, Port_Y_Size],
                    fillet=Thickness/2, edges=EDGES_X_ALL
                );
            } else if (len(port) == 3) {
                xcyl(h=Thickness * 1.1, d=Port_X_Size);
            }
        }

        for ( port = Front_Ports ) {
            Is_Rect = (len(port) == 4);
            Port_X_Offset = port[0];
            Port_Y_Offset = port[1];
            Port_X_Size = port[2];
            Port_Y_Size = Is_Rect ? port[3] : port[2];
            up((Port_Y_Size / 2) + Port_Y_Offset)
            forward((Size_Y / 2) - (Thickness / 4))
            left((Size_X / 2) - (Port_X_Size / 2) - Port_X_Offset)
            if (Is_Rect) {
                cuboid(
                    [Port_X_Size, Thickness * 1.1, Port_Y_Size],
                    fillet=Thickness / 2, edges=EDGES_Y_ALL
                );
            } else if (len(port) == 3) {
                ycyl(h=Thickness * 1.1, d=Port_X_Size);
            }
        }

        for ( port = Back_Ports ) {
            Is_Rect = (len(port) == 4);
            Port_X_Offset = port[0];
            Port_Y_Offset = port[1];
            Port_X_Size = port[2];
            Port_Y_Size = Is_Rect ? port[3] : port[2];
            up((Port_Y_Size / 2) + Port_Y_Offset)
            back((Size_Y / 2) - (Thickness / 4))
            right((Size_X / 2) - (Port_X_Size / 2) - Port_X_Offset)
            if (Is_Rect) {
                cuboid(
                    [Port_X_Size, Thickness * 1.1, Port_Y_Size],
                    fillet=Thickness / 2, edges=EDGES_Y_ALL
                );
            } else if (len(port) == 3) {
                ycyl(h=Thickness * 1.1, d=Port_X_Size);
            }
        }
    }
}
