// Case size
case_thickness = 2;
case_width = 86;
case_length = 96;
case_height = 25;

module pin_mount(base_r, base_h, pin_r, pin_h, sep_x, sep_y) {
    cylinder(r=base_r, h=base_h);
    cylinder(r=pin_r, h=pin_h);

    translate([sep_x, 0, 0]) {
        cylinder(r=base_r, h=base_h);
        cylinder(r=pin_r, h=pin_h);
    }

    translate([0, sep_y, 0]) {
        cylinder(r=base_r, h=base_h);
        cylinder(r=pin_r, h=pin_h);
    }

    translate([sep_x, sep_y, 0]) {
        cylinder(r=base_r, h=base_h);
        cylinder(r=pin_r, h=pin_h);
    }
}

module case_bottom(w, l, h, thickness) {
    //bottom plate and outside with rounded edges
    color("DarkCyan") {
        difference() {
            minkowski() {
                cube([w, l, h]);
                cylinder(r=2, h=thickness);
            };
            translate([thickness, thickness, thickness])
                minkowski() {
                    cube([w - (thickness*2), l - (thickness*2), h]);
                    cylinder(r=2, h=thickness);
                };
        }
    }

    //NodeMCU Mount Pins
    translate([20, 20, 0])
        pin_mount(
            base_r=2, base_h=case_height/2,
            pin_r=1, pin_h=case_height*0.7,
            sep_x=10, sep_y=10
        );
}

case_bottom(
    w=case_width,
    l=case_length,
    h=case_height,
    thickness=case_thickness
);
