include <BOSL/constants.scad>;
use <BOSL/shapes.scad>;
use <BOSL/transforms.scad>;

module PCB(
        PCB_Color = "Green",
        Text_Color = "White",
        Text_Content = "PCB",
        Size = [56, 85],) {
    PCB_Width = Size[0];
    PCB_Length = Size[1];
    %color(PCB_Color, 0.2) {
        cuboid([PCB_Width, PCB_Length, 1], fillet=2, edges=EDGES_Z_ALL);
    }

    %up(2) {
        color(Text_Color, 0.4) {
            linear_extrude(height=1) {
                text(Text_Content, font="Times", halign="center", valign="center");
            }
        }
    }
}
