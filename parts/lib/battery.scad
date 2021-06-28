include <BOSL/constants.scad>;
use <BOSL/shapes.scad>;
use <BOSL/transforms.scad>;

include <constants.scad>;

module Battery_18650(Color = "Purple") {
    Battery_Length =18650_LENGTH;
    Battery_Diameter = 18650_DIAMETER;

    Contact_Diameter = 18650_DIAMETER * 0.75;
    Contact_Color = "Gray";

    Positive_Diameter = 18650_DIAMETER * 0.4;
    Positive_Color = "LightGray";
    Positive_Notch_Height = 0.65;

    Text_Color = "Black";
    Text_Height = 1;

    // Battery
    %color(Color) {
        difference() {
            zcyl(l=Battery_Length, d=Battery_Diameter);
            zcyl(l=Battery_Length + 1, d=Contact_Diameter);
        }
    }

    // Both contacts
    %color(Contact_Color) {
        zcyl(l=Battery_Length + 0.01, d=Contact_Diameter);
    }

    // Negative text
    color(Text_Color, 0.4) {
        down((Battery_Length / 2) + (Positive_Notch_Height / 2) + (Text_Height / 2))
        linear_extrude(height=Text_Height) {
            forward(1.5)
            text("-", font="Times", halign="center", valign="center", size=8);
        }
    }

    // Positive contact notch
    up((Battery_Length / 2) + (Positive_Notch_Height / 2))
    %color(Positive_Color) {
        zcyl(l=Positive_Notch_Height, d=Positive_Diameter);
    }

    // Positive text
    color(Text_Color, 0.4) {
        up((Battery_Length / 2) + (Positive_Notch_Height / 2) + (Text_Height / 2))
        linear_extrude(height=Text_Height) {
            text("+", font="Times", halign="center", valign="center", size=5);
        }
    }
}
