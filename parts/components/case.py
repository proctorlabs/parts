#!/usr/bin/env python3
from ..common import *


class Case(ScadBase):
    def __init__(self, thickness=1.5, width=100, length=100, height=25):
        super().__init__()
        self.thickness = thickness
        self.width = width
        self.length = length
        self.height = height

    def name(self):
        return 'Generic Case'

    def render(self):
        return minkowski()(
            cube([self.width, self.length, self.height]), cylinder(r=self.thickness, h=self.thickness)) - translate([self.thickness, self.thickness, self.thickness])(
            minkowski()(
                cube([self.width - (self.thickness*2), self.length - (self.thickness*2), self.height]
                     ), cylinder(r=self.thickness, h=self.thickness)
            ))
