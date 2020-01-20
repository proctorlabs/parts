#!/usr/bin/env python3
from ..common import *


class Case(ScadBase):
    def __init__(self, thickness=1.5, width=100, length=100, height=25, mounts=[], wire_guides=[]):
        super().__init__()
        self.thickness = thickness
        self.width = width
        self.length = length
        self.height = height
        self.mounts = mounts
        self.wire_guides = wire_guides

    def name(self):
        return 'Generic Case'

    def render(self):
        sub = union()
        for mnt in self.mounts:
            (x, y) = (mnt[0], mnt[1])
            if (x < 0):
                x = self.width + x
            if (y < 0):
                y = self.length + y
            sub = sub + translate([x, y, -0.2])(
                cylinder(r=mnt[2], h=self.thickness + 0.4))

        for mnt in self.wire_guides:
            h = rotate([90 * mnt[1], 90, 0])
            (sidex, sidey) = (
                (mnt[0] * (self.width if mnt[0] != 0 else self.length)) - 0.2, 0.2)
            (offset, z) = (
                mnt[2] + ((self.length if mnt[0] > 0 else self.width) / 2),
                mnt[3] + (self.height / 2)
            )
            sub = sub + translate([sidex + (offset * mnt[1]), sidey + (offset * mnt[0]), z])(h(
                cylinder(r=mnt[4], h=self.thickness + 0.4)))

        return minkowski()(
            cube([self.width, self.length, self.height]), cylinder(r=self.thickness, h=self.thickness)) - translate([self.thickness, self.thickness, self.thickness])(
            minkowski()(
                cube([self.width - (self.thickness*2), self.length - (self.thickness*2), self.height]
                     ), cylinder(r=self.thickness, h=self.thickness)
            )) - sub
