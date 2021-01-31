include <lib/all.scad>;

/* [Stand] */
BASE_SIZE = 24.0;
THICKNESS = 4.0;
HEIGHT = 18;
INCLUDE_JOIN_ROD = true;
JOIN_ROD_DIAMETER = 4.7625;

/* [PCB Dimensions] */
PCB_THICKNESS = 2.8;

INCLUDE_PIN = true;
PIN_DIAMETER = 2.5;
PIN_X_OFFSET = 4.5;
PIN_Y_OFFSET = 4.5;

/* [Hidden] */
$fs = 0.32;
E = 0.001;
PIN_TOTAL_HEIGHT = PCB_THICKNESS + THICKNESS;
FUDGE_FACTOR = 1;

module Rim() {
    difference() {
        up((HEIGHT/2) - (THICKNESS/2))
        right(E*2)
        forward(E*2)
        cuboid([BASE_SIZE+(4*E), BASE_SIZE+(4*E), HEIGHT+E], fillet=THICKNESS/2,
            edges=EDGE_FR_RT + EDGE_FR_LF + EDGE_BK_RT
        );
        
        up((HEIGHT/2) - (THICKNESS/2))
        left(E+THICKNESS/2)
        back(E+THICKNESS/2)
        cuboid([BASE_SIZE, BASE_SIZE, HEIGHT+(E*2)],
            fillet=THICKNESS,
            edges=EDGE_FR_RT
        );
    }
}

module Foot() {
    difference() {
        cuboid([BASE_SIZE, BASE_SIZE, THICKNESS], fillet=THICKNESS/2,
            edges=EDGE_FR_RT + EDGE_FR_LF + EDGE_BK_RT
        );
        
        left(E+ BASE_SIZE/2 - THICKNESS/3) 
        back(E+ BASE_SIZE/2 - THICKNESS/3)
        cuboid([BASE_SIZE, BASE_SIZE, THICKNESS+E],
            fillet=THICKNESS,
            edges=EDGE_FR_RT
        );
    }
}

module PCB_Pad() {
    difference() {
        up((HEIGHT/2) - (THICKNESS/2))
        right(E+ BASE_SIZE/4) 
        forward(E+ BASE_SIZE/4)
        cuboid([BASE_SIZE / 2, BASE_SIZE / 2, HEIGHT-E],
            fillet=THICKNESS/2, 
            edges=EDGE_FR_RT + EDGE_BK_LF
        );

        up((HEIGHT) - PCB_THICKNESS+E)
        right(E+ (BASE_SIZE/4) - (THICKNESS/2))
        forward(E+ (BASE_SIZE/4) - (THICKNESS/2))
        cuboid([BASE_SIZE / 2, BASE_SIZE / 2, PCB_THICKNESS],
            fillet=THICKNESS/2, 
            edges=EDGE_FR_RT
        );
    }
}

module Pin() {
    if (INCLUDE_PIN) {
        up(HEIGHT - (THICKNESS/2) + (PIN_TOTAL_HEIGHT / 2) - PCB_THICKNESS)
        right((BASE_SIZE/2) - (PIN_DIAMETER/2) - PIN_X_OFFSET - (THICKNESS / 2))
        forward((BASE_SIZE/2) - (PIN_DIAMETER/2) - PIN_Y_OFFSET - (THICKNESS / 2))
        cyl(l=PIN_TOTAL_HEIGHT, d=PIN_DIAMETER);
    }
}

module Pin_Mask() {
    if (INCLUDE_PIN) {
        up((PIN_TOTAL_HEIGHT / 2) - (THICKNESS / 2))
        right((BASE_SIZE/2) - (PIN_DIAMETER/2) - PIN_X_OFFSET - (THICKNESS / 2))
        forward((BASE_SIZE/2) - (PIN_DIAMETER/2) - PIN_Y_OFFSET - (THICKNESS / 2))
        cyl(l=E+PIN_TOTAL_HEIGHT+FUDGE_FACTOR, d=PIN_DIAMETER + (FUDGE_FACTOR / 2));
    }
}

module Joiner() {
    if (INCLUDE_JOIN_ROD) {
        right(BASE_SIZE/2 - THICKNESS/2 + JOIN_ROD_DIAMETER/2)
        forward(BASE_SIZE/2 - THICKNESS/2 + JOIN_ROD_DIAMETER/2)
        up(HEIGHT/2 - THICKNESS/2)
        cyl(l=HEIGHT+E*2, d=JOIN_ROD_DIAMETER + THICKNESS);
    }
}

module Joiner_Mask() {
    if (INCLUDE_JOIN_ROD) {
        right(BASE_SIZE/2 - THICKNESS/2 + JOIN_ROD_DIAMETER/2)
        forward(BASE_SIZE/2 - THICKNESS/2 + JOIN_ROD_DIAMETER/2)
        up(HEIGHT/2 - THICKNESS/2)
        cyl(l=HEIGHT+E*3, d=JOIN_ROD_DIAMETER);
    }
}

difference() {
    union() {
        color("Silver") Rim();
        color("CadetBlue") Foot();
        color("Olive") PCB_Pad();
        color("DarkOliveGreen") Pin();
        color("Red") Joiner();
    }
    Pin_Mask();
    Joiner_Mask();
}
