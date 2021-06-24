include <BOSL/constants.scad>;
use <BOSL/shapes.scad>;
use <BOSL/transforms.scad>;

E = 0.001;

module Case_Lid(
    Case_Color = "SteelBlue",
    Thickness = 2.5,
    Vents = true,
    Vent_Extra_Margin = 10,
    Size = [125, 75, 7],
    Cutouts = [],
) {
    EDGES = EDGES_Z_ALL; //TODO: Make optional
    Size_X = Size[0] + (Thickness * 2);
    Size_Y = Size[1] + (Thickness * 2);
    Insert_Length = Size[2];
    Vents_Spread_Y = Size_Y > Size_X;

    color(Case_Color)
    difference() {
        up((Thickness/2))
        cuboid([Size_X, Size_Y, Thickness], fillet=Thickness, edges=EDGES);

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

        for ( port = Cutouts ) {
            Is_Rect = (len(port) == 4);
            Port_X_Offset = port[0];
            Port_Y_Offset = port[1];
            Port_X_Size = port[2];
            Port_Y_Size = Is_Rect ? port[3] : port[2];
            up(Thickness / 2)
            left((Size_X / 2) - (Thickness/4) - Port_Y_Offset)
            forward((Size_Y / 2) - (Port_X_Size / 2) - Port_X_Offset - Thickness)
            if (Is_Rect) {
                cuboid(
                    [Port_X_Size, Port_Y_Size, Thickness*1.1],
                    fillet=0, edges=EDGES_Z_ALL
                );
            } else if (len(port) == 3) {
                xcyl(h=Thickness * 1.1, d=Port_X_Size);
            }
        }
    }
    color(Case_Color)
    up((Thickness) + (Insert_Length/2))
    difference() {
        cuboid([Size_X - (Thickness), Size_Y - (Thickness), Insert_Length], fillet=Thickness, edges=EDGES);
        cuboid([Size_X - (Thickness * 2.5), Size_Y - (Thickness * 2.5), Insert_Length + (E*2)], fillet=Thickness, edges=EDGES);
    }
}
