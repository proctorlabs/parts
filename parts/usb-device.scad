include <lib/all.scad>;

/* [Options] */
// Whether we are creating the main case 
Make_Case = true;
// Whether we are creating the cap 
Make_Cap = false;
// How deep to make the cap
Cap_Depth = 6;
// Thickness of the case exterior
Shell_Thickness = 1.5;

/* [PCB Dimensions] */
// Length of the PCB (exclude the USB port)
PCB_Length = 45;
// Width of the PCB
PCB_Width = 35;
// Height required by the PCB
PCB_Height = 10.5;

/* [Engraving] */
// The engraving text of the drive to be written on the bottom
Engrave_Text = "😀";
// Font size for the engraving
Engrave_Text_Size = 10; // [0:30]
// The font to use for engraving
Engrave_Font = "DejaVu Sans:style=Bold";

/* [USB Port] */
// Override standard USB Length <SHOULDN'T NEED TO CHANGE>
USB_Length = 12.2;
// Override standard USB Height <SHOULDN'T NEED TO CHANGE>
USB_Height = 4.6;
// Override standard USB Width <SHOULDN'T NEED TO CHANGE>
USB_Width = 12.7;

/* [Hidden] */
unit_length = PCB_Length + (Shell_Thickness * 2);
unit_width  = PCB_Width + (Shell_Thickness * 2);
unit_height = PCB_Height + (Shell_Thickness * 3);
$fs = 0.3;

if (Make_Cap) {
    //back edge
    roundedcube([unit_width, Shell_Thickness, unit_height], apply_to="all");

    //bottom
    roundedcube([unit_width, Cap_Depth, Shell_Thickness], apply_to="ymin");

    //top
    translate([0, 0, unit_height - Shell_Thickness])
        roundedcube([unit_width, Cap_Depth, Shell_Thickness], apply_to="ymin");

    //left side
    translate([PCB_Width + Shell_Thickness, 0, 0])
        roundedcube([Shell_Thickness, Cap_Depth, unit_height], apply_to="ymin");

    //left side tab
    translate([PCB_Width, 0, unit_height * 0.3])
        difference() {
            roundedcube([1, Cap_Depth*2, unit_height * 0.4], apply_to="xmin");
            translate([-0.1, Cap_Depth * 1.5, 1]) cube([1.2, 1.4, 1.4]);
        }

    //right side
    roundedcube([Shell_Thickness, Cap_Depth, unit_height], apply_to="ymin");

    //right side tab
    translate([Shell_Thickness, 0, unit_height * 0.3])
        difference() {
            roundedcube([1, Cap_Depth*2, unit_height * 0.4], apply_to="xmin");
            translate([-0.1, Cap_Depth * 1.5, 1]) cube([1.2, 1.4, 1.4]);
        }
}

if (Make_Case) {
    //base
    difference() {
        roundedcube([unit_width, unit_length, Shell_Thickness], apply_to="ymax");
        translate([PCB_Width/2, PCB_Length/2, 0.1])
            rotate([180,0,90])
                linear_extrude(height = 0.5)
                    text(
                        text = Engrave_Text, 
                        font = Engrave_Font,
                        size = Engrave_Text_Size, 
                        valign = "center", 
                        halign = "center");
    }

    //top
    difference() {
        translate([0, 0, unit_height - Shell_Thickness])
            roundedcube([unit_width, unit_length, Shell_Thickness], apply_to="ymax");
        translate([PCB_Width/2, PCB_Length/2, unit_height + 0.3])
            rotate([180,0,90])
                linear_extrude(height = 0.5)
                    text(
                        text = Engrave_Text, 
                        font = Engrave_Font,
                        size = Engrave_Text_Size, 
                        valign = "center", 
                        halign = "center");
    }

    //front edge (where port is)
    difference() {
        translate([0, unit_length-Shell_Thickness, 0])
            roundedcube([unit_width, Shell_Thickness, unit_height], apply_to="all");

        translate([(PCB_Width - USB_Width) / 2 + Shell_Thickness, unit_length-(Shell_Thickness + 0.1), (Shell_Thickness * 2) + 0.1])
            cube([USB_Width, Shell_Thickness + 0.2, USB_Height+0.1]);
    }

    //left side
    translate([PCB_Width + Shell_Thickness, 0, 0])
        roundedcube([Shell_Thickness, unit_length, unit_height], apply_to="ymax");
    //left side tab catch
    translate([PCB_Width, 0, unit_height * 0.3])
        translate([1.1, Cap_Depth * 0.45, 1]) rotate([0, -90, 0]) prism(1.2, 1.4, 1.4);

    //right side
    roundedcube([Shell_Thickness, unit_length, unit_height], apply_to="ymax");
    //right side tab catch
    translate([Shell_Thickness, 0, unit_height * 0.3])
        translate([-0.1, Cap_Depth * 0.45, 2.2]) rotate([0, 90, 0]) prism(1.2, 1.4, 1.4);

}



module prism(l, w, h) {
    polyhedron(
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3], [5,4,3,2], [0,4,5,1], [0,3,4], [5,2,1]]);
}
