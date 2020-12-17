include <lib/all.scad>;

/* [General] */
Rack_Height = 2;
Rack_Thickness = 3;
Rack_Depth = 100;
Rod_Diameter = 4;

/* [Hidden] */
// 1U = 44.5mm
Rack_Height_Unit = 44.5;
// Full size rack is 482mm wide
Rack_Width_Unit = 482;
Screw_Spacing = 15.875;
Ear_Width = 15.875;

Width = 1 * Rack_Width_Unit;
Height = Rack_Height_Unit * Rack_Height;
Thickness = Rack_Thickness;

Half_Width = Width / 2;
Half_Height = Height / 2;
Half_Thickness = Thickness / 2;
Half_Depth = Rack_Depth / 2;

//Colors
Ear_Color = "DarkGray";
Face_Color = "Olive";
Rod_Color = "Silver";

module Rack() {
    left(Half_Width + Half_Thickness) back(Half_Depth - Half_Thickness)
        Rack_Ear();
    color(Face_Color) {
        // down(Half_Height - Half_Thickness) back(Half_Thickness)
        //     cuboid([Width, Rack_Thickness * 2, Rack_Thickness]);
        // up(Half_Height - Half_Thickness) back(Half_Thickness)
        //     cuboid([Width, Rack_Thickness * 2, Rack_Thickness]);
    }
    right(Half_Width + Half_Thickness) back(Half_Depth - Half_Thickness) xflip()
        Rack_Ear();
}

module Rack_Ear() {
    color(Ear_Color) {
        cuboid([Rack_Thickness, Rack_Depth, Height]);
        fwd(Half_Depth - Half_Thickness) left((Ear_Width / 2) + Half_Thickness)
            cuboid([Ear_Width, Rack_Thickness, Height]);
    }
}

Rack();
color(Rod_Color) {
    up(Half_Height - Thickness) back(Thickness)
        xcyl(h=Width + (Thickness*2) + 0.1, d=Rod_Diameter);
    
    down(Half_Height - Thickness) back(Thickness)
        xcyl(h=Width + (Thickness*2) + 0.1, d=Rod_Diameter);
}