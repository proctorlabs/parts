include <lib/all.scad>;
include <NopSCADlib/lib.scad>

Space_Width = 1000;
Space_Depth = 750;
Space_Height = 750;

Half_Width = Space_Width / 2;
Half_Depth = Space_Depth / 2;
Half_Height = Space_Height / 2;

// Bottom extrusions
left(Half_Width - 10) xrot(90) extrusion(E2020, Space_Depth - 40);
right(Half_Width - 10) xrot(90) extrusion(E2020, Space_Depth - 40);
back(Half_Depth - 10) yrot(90) extrusion(E2020, Space_Width);
fwd(Half_Depth - 10) yrot(90) extrusion(E2020, Space_Width);

// Vertical extrusions
up(Half_Height - 10) {
    left(Half_Width - 10) back(Half_Depth - 10) extrusion(E2020, Space_Height - 40);
    right(Half_Width - 10) back(Half_Depth - 10) extrusion(E2020, Space_Height - 40);
    left(Half_Width - 10) fwd(Half_Depth - 10) extrusion(E2020, Space_Height - 40);
    right(Half_Width - 10) fwd(Half_Depth - 10) extrusion(E2020, Space_Height - 40);
}

// Top extrusions
up(Space_Height - 20) {
    left(Half_Width - 10) xrot(90) extrusion(E2020, Space_Depth - 40);
    right(Half_Width - 10) xrot(90) extrusion(E2020, Space_Depth - 40);
    back(Half_Depth - 10) yrot(90) extrusion(E2020, Space_Width);
    fwd(Half_Depth - 10) yrot(90) extrusion(E2020, Space_Width);
}

// Lead screws
up(Half_Height) {
    left(Half_Width - 30) fwd(Half_Depth - 10) studding(8, Space_Height - 20);
    right(Half_Width - 30) fwd(Half_Depth - 10) studding(8, Space_Height - 20);
    left(Half_Width - 30) back(Half_Depth - 10) studding(8, Space_Height - 20);
    right(Half_Width - 30) back(Half_Depth - 10) studding(8, Space_Height - 20);
}

up(Half_Height) {
    left(Half_Width - 30) xrot(90) extrusion(E2020, Space_Depth);
    up(7.5) left(Half_Width - 30) zrot(90) carriage(MGN12_carriage);
    right(Half_Width - 30) xrot(90) extrusion(E2020, Space_Depth);
    up(7.5) right(Half_Width - 30) zrot(90) carriage(MGN12_carriage);
    up(30) yrot(90) extrusion(E2020, Space_Width - 40);
    up(40) back(25) hot_end(E3Dv6, 30);
}
