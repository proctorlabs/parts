
// USB Port dimensions
USB_A_LENGTH = 12.2;
USB_A_HEIGHT = 4.6;
USB_A_WIDTH = 12.7;

// Screws
M2_5_DIAMETER = 2.5; // Common SBC size
M3_DIAMETER = 3.0; // Common motherboard size
M6_DIAMETER = 6.0; // Rackmounts, etc...

// Other
JOIN_ROD_DIAMETER = 4.7625; // https://www.amazon.com/gp/product/B000H9LS96

// Rackmounts
1U_RACK_HEIGHT = 44.45;
2U_RACK_HEIGHT = 1U_RACK_HEIGHT * 2;
3U_RACK_HEIGHT = 1U_RACK_HEIGHT * 3;
4U_RACK_HEIGHT = 1U_RACK_HEIGHT * 4;

RACK_FULL_WIDTH = 482.6; // |o| ----------- |o| includes screw mounts
RACK_SCREW_PANEL_WIDTH = 15.875; // |o| just the screw panel
RACK_INSIDE_WIDTH = RACK_FULL_WIDTH - (RACK_SCREW_PANEL_WIDTH * 2); //  -------------
RACK_SCREW_DISTANCE_FROM_UNIT = 6.35; // Distance from the center of the first screw to the bottom of the rack
RACK_SCREW_DISTANCE_FROM_NEXT_SCREW = 15.875; // Screw distance within the same unit
RACK_SCREW_DISTANCE_FROM_NEXT_UNITS_SCREW = RACK_SCREW_DISTANCE_FROM_UNIT * 2; // From top of one unit to bottom of the next, not the same as above!
RACK_SCREW_DISTANCE_WIDTH = 465.12; // <-->
// Common screw types: M6, American #10-32, American #12-24, common to use square holes too for more flexibility

// Batteries
18650_DIAMETER = 18;
18650_DIAMETER_TOLERANCE = 0.41; // May vary by MFR, but this should cover it
18650_RADIUS = 18650_DIAMETER / 2;
18650_LENGTH = 65;
18650_LENGTH_TOLERANCE = 0.25;

// Switches
ROCKER_SWITCH_1_DIAMETER = 20.0; // https://www.amazon.com/gp/product/B07XC5KB8D/
ROCKER_SWITCH_2_DIAMETER = 20.7; // https://www.amazon.com/gp/product/B07T1JG6BD/
