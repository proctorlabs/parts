include <BOSL/constants.scad>;
use <BOSL/transforms.scad>;
use <BOSL/shapes.scad>;

module Din_Clip(thickness=6, screwDepth=10, screwDiameter=3) {
    outerScrewDiameter = screwDiameter * 1.1;
	difference() {
        // The clip itself
		linear_extrude(height=thickness, convexity=5) {
			polygon(
                points=[
                    [-9.731, 25.355], [5.910, 25.355], [6.675, 25.203],
                    [7.324, 24.770], [7.758, 24.121], [7.910, 23.355],
                    [7.910, 10.855], [7.764, 10.502], [7.410, 10.355],
                    [6.854, 10.355], [6.320, 10.510], [5.951, 10.925],
                    [4.910, 13.105], [3.910, 13.106], [3.910, -21.394],
                    [3.832, -21.783], [3.617, -22.101], [3.299, -22.315],
                    [2.910, -22.394], [-5.372, -22.394], [-5.736, -22.550],
                    [-5.852, -22.894], [-5.729, -23.238], [-5.372, -23.394],
                    [5.160, -23.394], [5.160, -21.464], [5.302, -21.239],
                    [5.566, -21.269], [9.561, -24.465], [9.730, -24.717],
                    [9.721, -25.021], [9.538, -25.263], [9.249, -25.355],
                    [-9.731, -25.355]],
                paths=[[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 0]]
			);
		}

        // Screw hole for the clip
        forward(22.5)
        up(thickness / 2)
        {
            forward(10) ycyl(l=10, d=outerScrewDiameter, center=false);
            ycyl(l=screwDepth, d=screwDiameter, center=false);
		}
	}
}
