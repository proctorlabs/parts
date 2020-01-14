#!/usr/bin/env python3
from solid import *
from solid.utils import *

# Case size
case_thickness = 2
case_width = 86
case_length = 96
case_height = 25


def pin(base_r, base_h, pin_r, pin_h):
    return cylinder(r=base_r, h=base_h) + cylinder(r=pin_r, h=pin_h)


def pin_insert(base_r, base_h, pin_r, pin_h):
    return cylinder(r=base_r, h=base_h) - cylinder(r=pin_r, h=pin_h)


def pin_rect(base_r=2, base_h=10, pin_r=1, pin_h=15, width=10, height=10):
    return pin(base_r, base_h, pin_r, pin_h) + translate([width, 0, 0])(pin(base_r, base_h, pin_r, pin_h)) + translate(
        [width, height, 0])(pin(base_r, base_h, pin_r, pin_h)) + translate([0, height, 0])(pin(base_r, base_h, pin_r, pin_h))


def casing(w, l, h, thickness):
    return minkowski()(
        cube([w, l, h]), cylinder(r=2, h=thickness)) - translate([thickness, thickness, thickness])(
        minkowski()(
            cube([w - (thickness*2), l - (thickness*2), h]
                 ), cylinder(r=2, h=thickness)
        ))


if __name__ == '__main__':
    print('Rendering file...')
    scad_render_to_file(
        casing(case_width, case_length, case_height, case_thickness) +
        translate([20, 20])(pin_rect()),
        filepath="out/test.scad",
        file_header=f'$fn = 180;',
        include_orig_code=False
    )
