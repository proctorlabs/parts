include <lib/all.scad>;

Include_Front_Lip = false;
Rail_Width = 128.44;
Rail_Depth = 119.9;
Rail_Height = 12;
Rail_Lip = 12;
Include_Rail_Notches = true;
Notch_Size = 14;
Crossbeam_Width = 10;
Crossbeam_Spacing = 29;
Thickness = 3.5;
Screw_Diameter = 7;
Rack_Units = 4;
Ear_Length = 25.5;
Lip_Depth = 13;
Rack_Height_Unit = 44.5;
Screw_Spacing = 15.875;
Join_Rod_Diameter = 4.7625;
$fs = 0.32;

Total_Width = Rail_Width + (Thickness * 2);
Total_Depth = Rail_Depth + Rail_Lip + Thickness;

module Rail() {
    // Front lip
    if (Include_Front_Lip) {
        back((Lip_Depth) - (Thickness / 2)) cuboid([
            Total_Width,
            Lip_Depth * 2,
            Thickness
        ]);
    } else {
        back((Lip_Depth / 2) - (Thickness / 2)) cuboid([
            Total_Width,
            Lip_Depth,
            Thickness
        ]);
    }

    // Left side
    up((Thickness / 2) + (Rail_Height / 2))
    back((Total_Depth / 2) - (Thickness / 2))
    left((Total_Width / 2) - (Thickness / 2))
    cuboid([
        Thickness,
        Total_Depth,
        Rail_Height
    ]);

    // Left joiner
    up(Join_Rod_Diameter - (Thickness / 2))
    left((Total_Width / 2) + (Thickness / 2))
    {
        back((Total_Depth / 8) - (Thickness / 2))
        cuboid([
            Join_Rod_Diameter * 2,
            Total_Depth / 4,
            Join_Rod_Diameter * 2
        ]);

        back((Total_Depth - (Total_Depth / 8)) - (Thickness / 2))
        cuboid([
            Join_Rod_Diameter * 2,
            Total_Depth / 4,
            Join_Rod_Diameter * 2
        ]);
    }

    // Left edge
    back((Total_Depth / 2) - (Thickness / 2))
    left((Total_Width / 2) - (Rail_Lip / 2))
    cuboid([
        Rail_Lip,
        Total_Depth,
        Thickness
    ]);

    // Right side
    up((Thickness / 2) + (Rail_Height / 2))
    back((Total_Depth / 2) - (Thickness / 2))
    right((Total_Width / 2) - (Thickness / 2))
    cuboid([
        Thickness,
        Total_Depth,
        Rail_Height
    ]);

    // Right joiner
    up(Join_Rod_Diameter - (Thickness / 2))
    right((Total_Width / 2) + (Thickness / 2))
    {
        back((Total_Depth / 8) - (Thickness / 2))
        cuboid([
            Join_Rod_Diameter * 2,
            Total_Depth / 4,
            Join_Rod_Diameter * 2
        ]);

        back((Total_Depth - (Total_Depth / 8)) - (Thickness / 2))
        cuboid([
            Join_Rod_Diameter * 2,
            Total_Depth / 4,
            Join_Rod_Diameter * 2
        ]);
    }

    // Right edge
    back((Total_Depth / 2) - (Thickness / 2))
    right((Total_Width / 2) - (Rail_Lip / 2))
    cuboid([
        Rail_Lip,
        Total_Depth,
        Thickness
    ]);

    // Crossbeams
    back((Lip_Depth / 2) + (Rail_Depth / 2))
    yspread(Crossbeam_Spacing, l=Rail_Depth)
    cuboid([
        Total_Width,
        Crossbeam_Width,
        Thickness
    ]);

    back((Total_Depth / 2) - (Thickness / 2))
    cuboid([
        Crossbeam_Width,
        Total_Depth,
        Thickness
    ]);

    // Back lip
    back(Total_Depth - (Lip_Depth / 2) - (Thickness / 2)) cuboid([
        Total_Width,
        Lip_Depth,
        Thickness
    ]);


}

difference() {
    Rail();

    // Front lip screw holes
    if (Include_Front_Lip) {
        back((Lip_Depth / 2) - (Thickness / 2))
        xspread(Screw_Spacing, l=Rail_Width - Thickness)
        zcyl(h=Thickness + 1, d=Screw_Diameter);
    }

    // Join rod holes
    up(Join_Rod_Diameter - (Thickness / 2))
    back(Total_Depth / 2)
    {
        left((Total_Width / 2) + (Thickness / 2))
        ycyl(h=Total_Depth * 2, d=Join_Rod_Diameter);
        right((Total_Width / 2) + (Thickness / 2))
        ycyl(h=Total_Depth * 2, d=Join_Rod_Diameter);
    }

    // Notches
    if (Include_Rail_Notches) {
        up(Rail_Height + 0.1)
        back((Total_Depth / 2))
        yspread(Notch_Size * 1.4, l=Total_Depth - (Crossbeam_Width * 2))
        cuboid([
            Total_Width + 1,
            Notch_Size,
            Thickness
        ]);
    }
}
