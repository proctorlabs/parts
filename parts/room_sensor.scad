include <lib/all.scad>;

/* [Hidden] */
$fs = 0.32;
E = 0.001;

// https://www.amazon.com/gp/product/B07QCP2451/
PCB_WIDTH = 22.86;
PCB_LENGTH = 48.26;

PCB_THRESHOLD = 2.5;
CASE_WIDTH = PCB_WIDTH + PCB_THRESHOLD;
CASE_LENGTH = PCB_LENGTH + PCB_THRESHOLD;
CASE_HEIGHT = 20.0;

DHT22_FUDGE = 1.0;
DHT22_LENGTH = 20.0 + DHT22_FUDGE;
DHT22_WIDTH = 15.1 + DHT22_FUDGE;

/* Make the case */
up(CASE_HEIGHT / 2)
PCB(Size = [PCB_LENGTH, PCB_WIDTH], Text_Content = "ESP32");
Case(
    Size = [CASE_LENGTH, CASE_WIDTH, CASE_HEIGHT],
    Left_Ports = [[(CASE_WIDTH / 2) - 3, 3, 12.9, 8]],
    Vent_Extra_Margin = 2,
    Thickness = 3
);

up(CASE_HEIGHT * 3)
Case_Lid(
    Size = [CASE_LENGTH, CASE_WIDTH, CASE_HEIGHT / 3],
    Vents = false,
    Thickness = 3,
    Cutouts = [[CASE_WIDTH / 8, CASE_LENGTH / 2.25, DHT22_LENGTH, DHT22_WIDTH]]
);
