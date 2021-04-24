include <lib/all.scad>;

/* [Hidden] */
$fs = 0.32;
E = 0.001;
FUDGE_FACTOR = 1;

up(8)
PCB(
    Size = [80, 40],
    Text_Content = "TEST"
);

Case(
    Size = [90,50,15],
    Front_Ports = [[10, 3, 8], [30, 3, 15, 7]]
);
